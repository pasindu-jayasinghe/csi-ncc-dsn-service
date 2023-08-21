import { DocumentService } from './../../document/document.service';
import { DocumentOwner } from './../../document/entity/document-owner.entity';
import { Currency } from './../../masterdata/entity/currency.entity';
import { SDBenefit } from './../../masterdata/entity/sd-benefit.entity';
import { ProjectType } from './../../project-program/entity/project-type.entity';
import { ClimateChangeDataCategory } from './../../parameter/entity/climate.change.data.category.entity';
import { Institution } from './../../institution/institution.entity';
import { PolicyData } from './../../policy/entity/policy-data.entity';
import { Policy } from './../../policy/entity/policy.entity';
import { Sector } from './../../parameter/entity/sector.entity';
import { DivisionalSecretariat } from './../../masterdata/entity/divisional.secretariat.entity';
import { District } from './../../masterdata/entity/district.entity';
import { Province } from './../../masterdata/entity/provice.entity';
import { count } from 'console';
import { ProjectStatus } from './../../project-program/entity/project-status.entity';
import { IPaginationOptions, paginate, Pagination } from 'nestjs-typeorm-paginate';
import { ProjectProgramData } from './../../project-program/entity/project-program-data.entity';
import { ProjectProgramme } from 'src/project-program/entity/project-programme.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { Documents } from 'src/document/entity/document.entity';
import { ProjectViewPage } from './dto/project-view-page.dto';

@Injectable()
export class PublicService {

    constructor(
        @InjectRepository(ProjectProgramme)
        private readonly projectProgrammeRepository: Repository<ProjectProgramme>,
        @InjectRepository(ProjectProgramData)
        private readonly projectProgramDataRepository: Repository<ProjectProgramData>,
        @InjectRepository(Documents)
        private readonly docRepository: Repository<Documents>,
        @InjectRepository(Policy)
        private readonly policyRepository: Repository<Policy>,
        @InjectRepository(PolicyData)
        private readonly policyDataRepository: Repository<PolicyData>,
        private docservice: DocumentService) {
    }

    async getProjectViewPageDetails(options: IPaginationOptions, name: string, dateofCommence: Number, sector: Number, ccdCatagary: Number, status: Number,
        location: string): Promise<Pagination<ProjectProgramme>> {

        let filter: string = 'pp.isPendingApprove = 0';

        if (name != null && name != undefined && name != "") {
            let searchText = 'pp.name like :name';

            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter + ' and ' + searchText;;
            }
        }

        if (dateofCommence != 0) {
            let searchText = 'YEAR(pp.proposedDateOfCommence) = :dateofCommence';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter + ' and ' + searchText;
            }
        }

        if (sector != 0) {
            let searchText = 'pp.sectorId = :sector';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter + ' and ' + searchText;;
            }
        }

        if (ccdCatagary != 0) {
            let searchText = 'pp.climateChangeDataCategoryId = :ccdCatagary';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter + ' and ' + searchText;;
            }
        }

        if (status != 0) {
            let searchText = 'pp.ProjectStatusId = :status';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter + ' and ' + searchText;;
            }
        }

        if (location != null && location != undefined && location != "") {
            let searchText = 'pv.name like :location  or d.name like :location  or ds.name like :location';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter + ' and ' + searchText;;
            }
        }


        const docCount = await this.docRepository.createQueryBuilder("d")
            // .select('`d`.id', 'docId')
            .select('`d`.documentOwnerId', 'documentOwnerId')
            .addSelect('count(*)', 'docCount')
            .where('`d`.documentOwner = 1')
            .groupBy('`d`.documentOwnerId').getRawMany();

        const publishPPD = await this.projectProgramDataRepository.createQueryBuilder("ppd")
            .where('`ppd`.dataRequestStatusId = 7').getRawMany();

        //console.log(publishPPD);
        let data = this.projectProgrammeRepository.createQueryBuilder("pp")
            .leftJoinAndMapOne('pp.projectStatus', ProjectStatus, 'ps', 'ps.id = pp.projectStatusId')
            .leftJoinAndMapOne('pp.dataSource', Institution, 'i', 'i.id = pp.dataSourceId')
            .leftJoinAndMapOne('pp.indirectSDBenefit', SDBenefit, 'isdb', 'isdb.id = pp.indirectSDBenefitId')
            .leftJoinAndMapOne('pp.directSDBenefit', SDBenefit, 'sdb', 'sdb.id = pp.directSDBenefitId')
            .leftJoinAndMapOne('pp.totalProjectCostCurrency', Currency, 'cu', 'cu.id = pp.totalProjectCostCurrencyId')
            .leftJoinAndMapOne('pp.projectType', ProjectType, 'pt', 'pt.id = pp.projectTypeId')
            .leftJoinAndMapOne('pp.province', Province, 'pv', 'ps.id = pp.provinceId')
            .leftJoinAndMapOne('pp.district', District, 'd', 'd.id = pp.districtId')
            .leftJoinAndMapOne('pp.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pp.divisionalSecretariatId')
            .leftJoinAndMapOne('pp.climateChangeDataCategory', ClimateChangeDataCategory, 'cc', 'cc.id = pp.climateChangeDataCategoryId')
            .leftJoinAndMapOne('pp.sector', Sector, 's', 's.id = pp.sectorId')
            .where(filter, { name: name + "%", dateofCommence, sector, ccdCatagary, status, location: location + "%" });

        let resualt = await paginate(data, options);

        for (const u of resualt.items) {
            let doc = docCount.find(a => a.documentOwnerId == u.id);
            if (doc !== null && doc !== undefined) {
                u.documentCount = doc.docCount;
            }
            else {
                u.documentCount = 0;
            }

            let publishData = publishPPD.filter(a => a.ppd_projectProgramId == u.id);
            //console.log(publishData);
            if (publishData !== null && publishData !== undefined && publishData.length > 0) {
                u.publishDataCount = publishData.length;
                var max = publishData.reduce(function (prev, current) {
                    if (+current.ppd_id > +prev.ppd_id) {
                        return current;
                    } else {
                        return prev;
                    }
                });
                u.publishLatestUpdate = max.ppd_projectProgress;
            }
            else {
                u.publishDataCount = 0;
                u.publishLatestUpdate = "";
            }

        }

        return resualt;
    }

    async getProjectViewinfo(id: Number): Promise<ProjectProgramme> {

        let filter: string = "pp.id = :id";
        let projectProgramme: ProjectProgramme;

        await this.projectProgrammeRepository.findOne({
            where: { id: id },
            relations: ["projectStatus", "dataSource", "indirectSDBenefit", "directSDBenefit", "totalProjectCostCurrency", "projectType",
                "province", "district", "divisionalSecretariat", "climateChangeDataCategory", "sector", "financingScheme"]
        }).then(a => {
            projectProgramme = a;
        })

        //console.log(publishPPD);
        // let data = this.projectProgrammeRepository.createQueryBuilder("pp")
        //     .leftJoinAndMapOne('pp.projectStatus', ProjectStatus, 'ps', 'ps.id = pp.projectStatusId')
        //     .leftJoinAndMapOne('pp.dataSource', Institution, 'i', 'i.id = pp.dataSourceId')
        //     .leftJoinAndMapOne('pp.indirectSDBenefit', SDBenefit, 'isdb', 'isdb.id = pp.indirectSDBenefitId')
        //     .leftJoinAndMapOne('pp.directSDBenefit', SDBenefit, 'sdb', 'sdb.id = pp.directSDBenefitId')
        //     .leftJoinAndMapOne('pp.totalProjectCostCurrency', Currency, 'cu', 'cu.id = pp.totalProjectCostCurrencyId')
        //     .leftJoinAndMapOne('pp.projectType', ProjectType, 'pt', 'pt.id = pp.projectTypeId')
        //     .leftJoinAndMapOne('pp.province', Province, 'pv', 'ps.id = pp.provinceId')
        //     .leftJoinAndMapOne('pp.district', District, 'd', 'd.id = pp.districtId')
        //     .leftJoinAndMapOne('pp.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pp.divisionalSecretariatId')
        //     .leftJoinAndMapOne('pp.climateChangeDataCategory', ClimateChangeDataCategory, 'cc', 'cc.id = pp.climateChangeDataCategoryId')
        //     .leftJoinAndMapOne('pp.sector', Sector, 's', 's.id = pp.sectorId')
        //     .leftJoinAndMapMany('pp.projectProgrammeData', ProjectProgramData, 'ppd', 'ppd.projectProgramId = pp.id and ppd.dataRequestStatusId = 7')
        //     .where(filter, { id });

        // let resualt = await data.getRawOne();

        console.log("========================================");
        console.log(projectProgramme)


        return projectProgramme;
    }

    async getPolicyViewPageDetails(options: IPaginationOptions, name: string, sector: Number, ccdCatagary: Number, influenceId: Number): Promise<Pagination<Policy>> {

        let filter: string = 'p.isPendingApprove = 0';
        //https://typeorm.io/#/many-to-many-relations

        if (name != null && name != undefined && name != "") {
            let searchTex = 'p.name like :name';
            if (filter == null) {
                filter = searchTex;
            }
            else {
                filter = filter + ' and ' + searchTex;
            }
        }

        let sctorPolicyresult = [];
        let ccdPolicyResult = []
        if (sector != 0) {
            let policyIds = await this.policyRepository.createQueryBuilder("ps")
                .select('`ps`.`id`', 'policyId')
                .leftJoin("ps.sector", "sector")
                .where('`sector`.`id` = :sector', { sector }).getRawMany();
            sctorPolicyresult = policyIds.map(a => a.policyId);

            let searchText = '`p`.`id` in (:sctorPolicyresult)';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter = filter + ' and ' + searchText;;
            }
        }

        if (ccdCatagary != 0) {
            let policyIds = await this.policyRepository.createQueryBuilder("ps")
                .select('`ps`.`id`', 'policyId')
                .leftJoin("ps.climateChangeDataCategory", "ccd")
                .where('`ccd`.`id` = :ccdCatagary', { ccdCatagary }).getRawMany();
            ccdPolicyResult = policyIds.map(a => a.policyId);

            let searchText = '`p`.`id` in (:ccdPolicyResult)';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter = filter + ' and ' + searchText;;
            }
        }

        if (influenceId != 0) {
            let searchText = 'p.influence = :influenceId';
            if (filter == null) {
                filter = searchText;
            }
            else {
                filter = filter = filter + ' and ' + searchText;;
            }
        }



        const docCount = await this.docRepository.createQueryBuilder("d")
            //.select('`d`.id', 'docId')
            .select('`d`.documentOwnerId', 'documentOwnerId')
            .addSelect('count(*)', 'docCount')
            .where('`d`.documentOwner = 2')
            .groupBy('`d`.documentOwnerId').getRawMany();

        const publishPPD = await this.policyDataRepository.createQueryBuilder("pd")
            .where('`pd`.dataRequestStatusId = 7').getRawMany();

        //console.log(publishPPD);
        let data = this.policyRepository.createQueryBuilder("p")
            .leftJoinAndMapOne('p.formulationInstitution', Institution, 'i', 'i.id = p.formulationInstitutionId')
            // .leftJoinAndMapOne('p.climateChangeDataCategory', ClimateChangeDataCategory, 'cc', 'cc.id = p.climateChangeDataCategoryId')
            //.leftJoinAndMapMany('p.sector', Sector, 's', 's.id = p.sectorId')
            .leftJoinAndSelect("p.sector", "sector")
            .leftJoinAndSelect("p.climateChangeDataCategory", "climateChangeDataCategory")

            .where(filter, { name: name + "%", sector, ccdCatagary, influenceId, sctorPolicyresult, ccdPolicyResult });


        let resualt = await paginate(data, options);

        for (const u of resualt.items) {
            let doc = docCount.find(a => a.documentOwnerId == u.id);
            if (doc !== null && doc !== undefined) {
                u.documentCount = doc.docCount;
            }
            else {
                u.documentCount = 0;
            }

            let publishData = publishPPD.filter(a => a.pd_policyId == u.id);
            console.log(publishData);
            if (publishData !== null && publishData !== undefined && publishData.length > 0) {
                u.publishDataCount = publishData.length;
                var max = publishData.reduce(function (prev, current) {
                    if (+current.pd_id > +prev.pd_id) {
                        return current;
                    } else {
                        return prev;
                    }
                });

                u.publishLatestUpdate = max.pd_amendments;
            }
            else {
                u.publishDataCount = 0;
                u.publishLatestUpdate = "";
            }

        }

        return resualt;
    }


    async getPublicDocuments(oid: number, owner: DocumentOwner): Promise<Documents[]> {
        let documenst = await this.docservice.getDocuments(oid, owner);

        return documenst;

    }
}
