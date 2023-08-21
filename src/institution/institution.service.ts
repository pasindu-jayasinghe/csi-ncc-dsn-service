import { User } from './../users/user.entity';
import { DataRequestStatusEnum } from './../masterdata/entity/datarequst-status.entity';
import { ParameterLocationData } from './../parameter/entity/parameter-location-data.entity';
import { RequestAssignSummary } from './dto/request-assign-summary.dto';
import { RecentUpdateSummary } from './dto/recent-update-summary.dto';
import { count, log } from 'console';
import { RequestSummary } from './dto/request-summary.dto';
import { Injectable, Logger } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { In, Not, Repository } from "typeorm";
import { TypeOrmCrudService } from "@nestjsx/crud-typeorm";
import { Institution } from "./institution.entity";
import { ProjectProgramData } from 'src/project-program/entity/project-program-data.entity';
import { PolicyData } from 'src/policy/entity/policy-data.entity';
import { Policy } from 'src/policy/entity/policy.entity';
import { paginate } from 'nestjs-typeorm-paginate';

@Injectable()
export class InstitutionService extends TypeOrmCrudService<Institution> {
  constructor(@InjectRepository(Institution) repo,
    @InjectRepository(ParameterLocationData)
    private readonly pldRepository: Repository<ParameterLocationData>,
    @InjectRepository(ProjectProgramData)
    private readonly ppdRepository: Repository<ProjectProgramData>,
    @InjectRepository(PolicyData)
    private readonly pdRepository: Repository<PolicyData>,
    @InjectRepository(User)
    private readonly userRepository: Repository<User>) {
    super(repo);

  }

  async softDelete(id: number) {
    this.repo.softDelete({ id });
    return;
  }

  async getRequestSummary(institutionId: number): Promise<RequestSummary[]> {
    let requestSummary: RequestSummary[] = new Array();


    // let paramdata = await this.pldRepository.createQueryBuilder("pld")
    //   .select("COUNT(*)", "count")
    //   .innerJoin('pld.parameterLocation', 'pl', 'pld.parameterLocationId = pl.id')
    //   .where("pl.dataSourceId = :insutationId and pld.dataRequestStatusId in (1,5)", { insutationId: institutionId })
    //   .getRawOne();

    let paramSummary: RequestSummary = new RequestSummary();
    paramSummary.Name = "Parameters";
    paramSummary.Count = await this.getParamCount(institutionId, [DataRequestStatusEnum.Needtoassign, DataRequestStatusEnum.RejectedfromtheCCS]);
    requestSummary.push(paramSummary);


    let projSummary: RequestSummary = new RequestSummary();
    projSummary.Name = "Projects";
    projSummary.Count = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.Needtoassign, DataRequestStatusEnum.RejectedfromtheCCS], true);
    requestSummary.push(projSummary);


    let programSummary: RequestSummary = new RequestSummary();
    programSummary.Name = "Programmes";
    programSummary.Count = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.Needtoassign, DataRequestStatusEnum.RejectedfromtheCCS], false);
    requestSummary.push(programSummary);


    let policySummary: RequestSummary = new RequestSummary();
    policySummary.Name = "Policies ";
    policySummary.Count = await this.getPolicyCount(institutionId, [DataRequestStatusEnum.Needtoassign, DataRequestStatusEnum.RejectedfromtheCCS]);
    requestSummary.push(policySummary);



    return requestSummary;
  }

  async getRecentUpdateSummary(institutionId: number): Promise<RecentUpdateSummary[]> {
    let summary: RecentUpdateSummary[] = new Array();

    let subCCSStatus: RecentUpdateSummary = new RecentUpdateSummary();
    subCCSStatus.Status = "Submitted to CCS";
    subCCSStatus.ParameterCount = await this.getParamCount(institutionId, [DataRequestStatusEnum.SubmittedtoCCS]);
    subCCSStatus.PolicieCount = await this.getPolicyCount(institutionId, [DataRequestStatusEnum.SubmittedtoCCS]);
    subCCSStatus.ProgrammeCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.SubmittedtoCCS], false);
    subCCSStatus.ProjectCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.SubmittedtoCCS], true);
    summary.push(subCCSStatus);

    let rehectIA: RecentUpdateSummary = new RecentUpdateSummary();
    rehectIA.Status = "Rejections for DEO";
    rehectIA.ParameterCount = await this.getParamCount(institutionId, [DataRequestStatusEnum.Rejectedandreassigned]);
    rehectIA.PolicieCount = await this.getPolicyCount(institutionId, [DataRequestStatusEnum.Rejectedandreassigned]);
    rehectIA.ProgrammeCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.Rejectedandreassigned], false);
    rehectIA.ProjectCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.Rejectedandreassigned], true);
    summary.push(rehectIA);

    let submitIA: RecentUpdateSummary = new RecentUpdateSummary();
    submitIA.Status = "Review needs"
    submitIA.ParameterCount = await this.getParamCount(institutionId, [DataRequestStatusEnum.Needtoreview]);;
    submitIA.PolicieCount = await this.getPolicyCount(institutionId, [DataRequestStatusEnum.Needtoreview]);
    submitIA.ProgrammeCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.Needtoreview], false);
    submitIA.ProjectCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.Needtoreview], true);
    summary.push(submitIA);


    let pendingDE: RecentUpdateSummary = new RecentUpdateSummary();
    pendingDE.Status = "Pending Data Entry"
    pendingDE.ParameterCount = await this.getParamCount(institutionId, [DataRequestStatusEnum.PendingDataEntry]);
    pendingDE.PolicieCount = await this.getPolicyCount(institutionId, [DataRequestStatusEnum.PendingDataEntry]);
    pendingDE.ProgrammeCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.PendingDataEntry], false);
    pendingDE.ProjectCount = await this.getProjectProgramCount(institutionId, [DataRequestStatusEnum.PendingDataEntry], true);
    summary.push(pendingDE);

    return summary;
  }

  async getRecentAssignSummary(institutionId: number): Promise<RequestAssignSummary[]> {
    let summary: RequestAssignSummary[] = new Array();
    let institution: Institution = new Institution();
    institution.id = institutionId;

    let userList = await this.userRepository.find({
      where: { institution: institution }
    });

    if (userList) {

      for (const u of userList) {

        let rehectIA: RequestAssignSummary = new RequestAssignSummary();
        rehectIA.UserName = `${u.title} ${u.firstName} ${u.lastName} `
        rehectIA.ParameterCount = await this.getParamCountForUser(institutionId, [DataRequestStatusEnum.PendingDataEntry], u.id);
        rehectIA.PolicieCount = await this.getPolicyCountforuser(institutionId, [DataRequestStatusEnum.PendingDataEntry], u.id);
        rehectIA.ProgrammeCount = await this.getProjectProgramCountForUser(institutionId, [DataRequestStatusEnum.PendingDataEntry], false, u.id);
        rehectIA.ProjectCount = await this.getProjectProgramCountForUser(institutionId, [DataRequestStatusEnum.PendingDataEntry], true, u.id);
        summary.push(rehectIA);

      };


      return summary;

    }



  }


  private async getParamCount(institutionId: number, statusids: number[]): Promise<number> {
    let paramdata = await this.pldRepository.createQueryBuilder("pld")
      .select("COUNT(*)", "count")
      .innerJoin('pld.parameterLocation', 'pl', 'pld.parameterLocationId = pl.id')
      .where("pl.dataSourceId = :insutationId and pld.dataRequestStatusId in (:statusids)", { insutationId: institutionId, statusids: statusids })
      .getRawOne();

    return paramdata.count;
  }

  private async getParamCountForUser(institutionId: number, statusids: number[], userId: number): Promise<number> {

    let where: String = "pl.dataSourceId = :insutationId and pld.dataRequestStatusId in (:statusids)";
    if (userId != 0) {
      where = where + " and deu.id = :userId";
    }

    let paramdata = await this.pldRepository.createQueryBuilder("pld")
      .select("COUNT(*)", "count")
      .innerJoin('pld.parameterLocation', 'pl', 'pld.parameterLocationId = pl.id')
      .innerJoin('pld.dataEntryUser', 'deu', 'pld.dataEntryUserId = deu.id')
      .where(where, { insutationId: institutionId, statusids: statusids, userId })
      .getRawOne();

    return paramdata.count;
  }


  private async getProjectProgramCount(institutionId: number, statusids: number[], isproject: boolean): Promise<number> {
    let projdata = await this.ppdRepository.createQueryBuilder("ppd")
      .select("COUNT(*)", "count")
      .innerJoin('ppd.projectProgram', 'pp', 'ppd.projectProgramId = pp.id')
      .where("pp.dataSourceId = :insutationId and ppd.dataRequestStatusId in (:statusids) and isProject = :isproject",
        { insutationId: institutionId, statusids, isproject })
      .getRawOne();

    return projdata.count;
  }

  private async getProjectProgramCountForUser(institutionId: number, statusids: number[], isproject: boolean, userId: number): Promise<number> {
    let projdata = await this.ppdRepository.createQueryBuilder("ppd")
      .select("COUNT(*)", "count")
      .innerJoin('ppd.projectProgram', 'pp', 'ppd.projectProgramId = pp.id')
      .innerJoin('ppd.dataEntryUser', 'deu', 'ppd.dataEntryUserId = deu.id')
      .where("pp.dataSourceId = :insutationId and ppd.dataRequestStatusId in (:statusids) and isProject = :isproject and ppd.dataEntryUserId = :userId",
        { insutationId: institutionId, statusids, isproject, userId })
      .getRawOne();

    return projdata.count;
  }


  private async getPolicyCount(institutionId: number, statusids: number[]): Promise<number> {
    let projdata = await this.pdRepository.createQueryBuilder("ppd")
      .select("COUNT(*)", "count")
      .innerJoin('ppd.policy', 'pp', 'ppd.policyId = pp.id')
      .where("pp.formulationInstitutionId = :insutationId and ppd.dataRequestStatusId in (:statusids)",
        { insutationId: institutionId, statusids })
      .getRawOne();

    return projdata.count;
  }

  private async getPolicyCountforuser(institutionId: number, statusids: number[], userId: number): Promise<number> {
    let Policydata = await this.pdRepository.createQueryBuilder("ppd")
      .select("COUNT(*)", "count")
      .innerJoin('ppd.policy', 'pp', 'ppd.policyId = pp.id')
      .innerJoin('ppd.dataEntryUser', 'deu', 'ppd.dataEntryUserId = deu.id')
      .where("pp.formulationInstitutionId = :insutationId and ppd.dataRequestStatusId in (:statusids) and ppd.dataEntryUserId = :userId",
        { insutationId: institutionId, statusids, userId })
      .getRawOne();

    return Policydata.count;
  }

  /**
   * 
   * @param page 
   * @param limit 
   * @param year 
   */
  async getAvailableInstitutionsForPolicyData(page: number, limit: number, year: number) {
    const qb = await this.repo.createQueryBuilder("ins");
    const query = qb
      .where(qb.subQuery().select("count(*)").from(PolicyData, "pd").where("pd.year = :year AND pd.institutionId = ins.id").getQuery()
        + " <> " +
        qb.subQuery().select("count(*)").from(Policy, "p").where("p.formulationInstitutionId = ins.id").getQuery())
      .setParameter("year", year);

    return paginate(query, {
      limit: limit,
      page: page
    });
  }


}
