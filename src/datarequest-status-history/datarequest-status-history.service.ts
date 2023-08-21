import { Institution } from './../institution/institution.entity';
import { PolicyData } from './../policy/entity/policy-data.entity';
import { DivisionalSecretariat } from './../masterdata/entity/divisional.secretariat.entity';
import { District } from './../masterdata/entity/district.entity';
import { Province } from './../masterdata/entity/provice.entity';
import { Policy } from './../policy/entity/policy.entity';
import { ProjectProgramme } from './../project-program/entity/project-programme.entity';
import { Parameter } from './../parameter/entity/parameter.entity';
import { IPaginationOptions, paginate, Pagination } from 'nestjs-typeorm-paginate';
import { UsersService } from './../users/users.service';
import { Userv2Service } from './../userv2/userv2.service';
import { User } from './../users/user.entity';
import { DataRequestStatus } from './../masterdata/entity/datarequst-status.entity';
import { ParameterLocationData } from './../parameter/entity/parameter-location-data.entity';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Injectable, Request } from '@nestjs/common';
import { DataRequestStatusHistory } from 'src/masterdata/entity/datarequst-status-history.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { ProjectProgramData } from 'src/project-program/entity/project-program-data.entity';
import { ParameterLocation } from 'src/parameter/entity/parameter-location.entity';

@Injectable()
export class DatarequestStatusHistoryService extends TypeOrmCrudService<DataRequestStatusHistory> {
    constructor(@InjectRepository(DataRequestStatusHistory) repo, public userService: Userv2Service, private usersService: UsersService,) {
        super(repo);
    }

    async crateStatusHistory(pld: ParameterLocationData, drs: DataRequestStatus, @Request() request, comment: string) {
        let userEmail = request.user.email;
        let user = await this.usersService.findUserByEmail(userEmail);
        let drHisrory: DataRequestStatusHistory = new DataRequestStatusHistory();
        drHisrory.name = "";
        drHisrory.description = "";
        drHisrory.sortOrder = 1;
        drHisrory.comment = comment;
        drHisrory.parameterLocationData = pld;
        drHisrory.parameterId = pld.parameterId;
        drHisrory.statusId = drs.id;
        drHisrory.statusText = drs.name;
        drHisrory.userId = user.id;
        drHisrory.userName = `${user.firstName} ${user.lastName}`;

        let history = this.repo.insert(drHisrory);
    }

    async crateProjectProgramDataStatusHistory(pld: ProjectProgramData, drs: DataRequestStatus, @Request() request, comment: string) {

        try {
            let userEmail = request.user.email;
            let user = await this.usersService.findUserByEmail(userEmail);
            let drHisrory: DataRequestStatusHistory = new DataRequestStatusHistory();
            drHisrory.name = "";
            drHisrory.description = "";
            drHisrory.sortOrder = 1;
            drHisrory.comment = comment;
            drHisrory.projectProgramData = pld;
            drHisrory.statusId = drs.id;
            drHisrory.statusText = drs.name;
            drHisrory.userId = user.id;
            drHisrory.userName = `${user.firstName} ${user.lastName}`;

            let history = this.repo.insert(drHisrory);

        }
        catch (error) {
            console.log("===========================================")
            console.log(error)
            console.log("===========================================")

        }

    }

    async cratePolicyDataStatusHistory(pld: PolicyData, drs: DataRequestStatus, @Request() request, comment: string) {
        let userEmail = request.user.email;
        let user = await this.usersService.findUserByEmail(userEmail);
        let drHisrory: DataRequestStatusHistory = new DataRequestStatusHistory();
        drHisrory.name = "";
        drHisrory.description = "";
        drHisrory.sortOrder = 1;
        drHisrory.comment = comment;
        drHisrory.policyData = pld;
        drHisrory.statusId = drs.id;
        drHisrory.statusText = drs.name;
        drHisrory.userId = user.id;
        drHisrory.userName = `${user.firstName} ${user.lastName}`;

        let history = this.repo.insert(drHisrory);
    }

    async getAuditDetails(options: IPaginationOptions, featureId: number, userId: number, fromDate: Date, toDate: Date): Promise<Pagination<DataRequestStatusHistory>> {

        let filter: string;

        let fDate = fromDate ? `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}` : null;
        let tDate = toDate ? `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}` : null;


        if (featureId != 0) {
            if (featureId == 1) {
                filter = 'dr.parameterId != 0 and dr.parameterId IS NOT NULL';
            }
            else if (featureId == 2) {
                filter = 'dr.projectProgramDataId != 0 and dr.projectProgramDataId IS NOT NULL';
            }
            else if (featureId == 3) {
                filter = 'dr.policyDataId != 0 and dr.policyDataId IS NOT NULL';
            }
        }


        if (userId != 0) {
            if (filter) {
                filter = `${filter}  and dr.userId = :userId`;
            }
            else {
                filter = `dr.userId = :userId`;
            }
        }

        if (fDate) {
            if (filter) {
                filter = `${filter} and DATE(dr.createdOn) >= :fDate`;
            }
            else {
                filter = `DATE(dr.createdOn) >= :fDate`;
            }
        }


        if (tDate) {
            if (filter) {
                filter = `${filter} and DATE(dr.createdOn) <= :tDate`;
            }
            else {
                filter = `DATE(dr.createdOn) <= :tDate`;
            }
        }



        let data = this.repo.createQueryBuilder("dr")
            .leftJoinAndMapOne('dr.parameterLocationData', ParameterLocationData, 'pld', 'pld.id = dr.parameterLocationDataId')
            .leftJoinAndMapOne('dr.parameterLocation', ParameterLocation, 'pl', 'pl.id = pld.parameterLocationId')
            .leftJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
            .leftJoinAndMapOne('p.institution', Institution, 'pi', 'p.institutionId = pi.id')
            .leftJoinAndMapOne('pl.province', Province, 'pr', 'pl.provinceId = pr.id')
            .leftJoinAndMapOne('pl.district', District, 'd', 'pl.districtId = d.id')
            .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'pl.divisionalSecretariatId = ds.id')

            .leftJoinAndMapOne('dr.projectProgramData', ProjectProgramData, 'ppd', 'ppd.id = dr.ProjectProgramDataId')
            .leftJoinAndMapOne('ppd.projectProgram', ProjectProgramme, 'pp', 'ppd.projectProgramId = pp.id')
            .leftJoinAndMapOne('pp.dataSource', Institution, 'ppi', 'pp.dataSourceId = ppi.id')
            // .leftJoinAndMapOne('dr.province', Province, 'ppdpr', 'pp.provinceId = ppdpr.id')
            // .leftJoinAndMapOne('dr.district', District, 'ppdd', 'pp.districtId = ppdd.id')
            // .leftJoinAndMapOne('dr.divisionalSecretariat', DivisionalSecretariat, 'ppdds', 'pp.divisionalSecretariatId = ppdds.id')

            .leftJoinAndMapOne('dr.policyData', PolicyData, 'pd', 'pd.id = dr.policyDataId')
            .leftJoinAndMapOne('pd.policy', Policy, 'po', 'pd.policyId = po.id')
            .leftJoinAndMapOne('po.formulationInstitution', Institution, 'poi', 'po.formulationInstitutionId = poi.id')
            // .leftJoinAndMapOne('dr.province', Province, 'pdpr', 'pd.provinceId = pdpr.id')
            // .leftJoinAndMapOne('dr.district', District, 'pdd', 'pd.districtId = pdd.id')
            // .leftJoinAndMapOne('dr.divisionalSecretariat', DivisionalSecretariat, 'pdds', 'po.divisionalSecretariatId = pdds.id')

            .innerJoinAndMapOne('dr.user', User, 'u', 'dr.userId = u.id')

            .where(filter, { featureId: featureId, userId: userId, fDate, tDate }).orderBy("dr.createdOn", "DESC");


        let resualt = await paginate(data, options);

        if (resualt) {
            for (const r of resualt.items) {
                if (r) {
                    if (r.parameterLocationData) {
                        r.itemDetails = `parameter: ${r.parameterLocationData.parameter?.name} /  ${r.parameterLocationData.parameter.institution?.name ? r.parameterLocationData.parameter.institution?.name + " / " : ""} 
${r.parameterLocationData.startDate.toISOString().split('T')[0]} - ${r.parameterLocationData.endDate.toISOString().split('T')[0]}`
                    }
                    else if (r.projectProgramData) {
                        r.itemDetails = `ProjectProgramme: ${r.projectProgramData?.projectProgram?.name}/ ${r.projectProgramData?.projectProgram?.dataSource?.name} / ${r.projectProgramData.year}`
                    }
                    else if (r.policyData) {
                        r.itemDetails = `Policy: ${r.policyData.policy?.name} / ${r.policyData.policy?.formulationInstitution?.name} / ${r.policyData.year}`
                    }
                }
            }

            return resualt;
        }
    }

}
