import { IPaginationOptions, paginate, Pagination } from 'nestjs-typeorm-paginate';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Institution } from 'src/institution/institution.entity';
import { Policy } from './entity/policy.entity';

@Injectable()
export class PolicyService extends TypeOrmCrudService<Policy> {
  constructor(@InjectRepository(Policy) repo) {
    super(repo);
  }

  async softDelete(id: number) {
    this.repo.softDelete({ id });
    return;
  }

  async getByInstitution(institutionId: number) {
    let list = await this.repo.find({ where: { formulationInstitution: { id: institutionId } } }).then(res => { return res });
    return list;
  }


  async getPolicyList(options: IPaginationOptions, name: string, sector: Number, ccdCatagary: Number, instutionId: Number, formulationInstutue: string, approve: number): Promise<Pagination<Policy>> {

    let filter: string = null;
    //https://typeorm.io/#/many-to-many-relations

    if (name != null && name != undefined && name != "") {
      if (filter == null) {
        filter = 'p.name like :name';
      }
    }


    if ((approve == 1 || approve == 0)) {
      let searchText = 'p.isPendingApprove = :approve';
      if (filter == null) {
        filter = searchText;
      }
      else {
        filter = filter = filter + ' and ' + searchText;;
      }
    }

    if (formulationInstutue != null && formulationInstutue != undefined && formulationInstutue != "") {
      let searchText = 'p.originalFormulationInstitution like :formulationInstutue';
      if (filter == null) {
        filter = searchText;
      }
      else {
        filter = filter = filter + ' and ' + searchText;;
      }
    }

    let sctorPolicyresult = [];
    let ccdPolicyResult = []
    if (sector != 0) {
      let policyIds = await this.repo.createQueryBuilder("ps")
        .select('`ps`.`id`', 'policyId')
        .leftJoin("ps.sector", "sector")
        .where('`sector`.`id` = :sector', { sector }).getRawMany();
      sctorPolicyresult = policyIds.map(a => a.policyId);

      if (sctorPolicyresult.length == 0) {
        sctorPolicyresult.push(-99999);
      }

      let searchText = '`p`.`id` in (:sctorPolicyresult)';
      if (filter == null) {
        filter = searchText;
      }
      else {
        filter = filter = filter + ' and ' + searchText;;
      }
    }

    if (ccdCatagary != 0) {
      let policyIds = await this.repo.createQueryBuilder("ps")
        .select('`ps`.`id`', 'policyId')
        .leftJoin("ps.climateChangeDataCategory", "ccd")
        .where('`ccd`.`id` = :ccdCatagary', { ccdCatagary }).getRawMany();
      ccdPolicyResult = policyIds.map(a => a.policyId);

      if (ccdPolicyResult.length == 0) {
        ccdPolicyResult.push(-99999);
      }

      let searchText = '`p`.`id` in (:ccdPolicyResult)';
      if (filter == null) {
        filter = searchText;
      }
      else {
        filter = filter = filter + ' and ' + searchText;;
      }
    }

    if (instutionId != 0) {
      let searchText = 'i.id = :instutionId';
      if (filter == null) {
        filter = searchText;
      }
      else {
        filter = filter = filter + ' and ' + searchText;;
      }
    }

    let data = this.repo.createQueryBuilder("p")
      .leftJoinAndMapOne('p.formulationInstitution', Institution, 'i', 'i.id = p.formulationInstitutionId')
      // .leftJoinAndMapOne('p.climateChangeDataCategory', ClimateChangeDataCategory, 'cc', 'cc.id = p.climateChangeDataCategoryId')
      //.leftJoinAndMapMany('p.sector', Sector, 's', 's.id = p.sectorId')
      .leftJoinAndSelect("p.sector", "sector")
      .leftJoinAndSelect("p.climateChangeDataCategory", "climateChangeDataCategory")
      .where(filter, { name: "%" + name + "%", sector, ccdCatagary, instutionId, sctorPolicyresult, ccdPolicyResult, formulationInstutue: "%" + formulationInstutue + "%", approve })
      .orderBy('p.name', "ASC");

    let resualt = await paginate(data, options);

    return resualt;
  }
}

