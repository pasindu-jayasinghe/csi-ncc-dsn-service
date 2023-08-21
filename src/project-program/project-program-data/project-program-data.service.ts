import { ProjectProgramData } from './../entity/project-program-data.entity';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ProjectProgramme } from '../entity/project-programme.entity';
import { Institution } from 'src/institution/institution.entity';
import { DataRequestStatus } from 'src/masterdata/entity/datarequst-status.entity';
import { ProjectStatus } from '../entity/project-status.entity';
import { ProjectDataAssignRequest } from '../dto/project-data-assign-req.dto';
import { User } from 'src/users/user.entity';
import { ProjectDataSaveRequest } from '../dto/project-data-save-req.dto';

@Injectable()
export class ProjectProgramDataService extends TypeOrmCrudService<ProjectProgramData> {
    constructor(@InjectRepository(ProjectProgramData) repo) {
        super(repo);
    }

    /**
     * 
     * @param year 
     * @param institutionId 
     */
    getRequestsList(year: number, institutionId: number, dataRequestStatusId: number[]) {
        let filter = "in.id = :institutionId AND year = :year";
        let params = { institutionId: institutionId, year: year };

        if (dataRequestStatusId.length > 0) {
            filter = filter + " AND ProjectProgramData.dataRequestStatusId IN (:...dataRequestStatusId)";
            params["dataRequestStatusId"] = dataRequestStatusId;
        }

        const query = this.repo.createQueryBuilder("ProjectProgramData")
            .leftJoinAndMapOne('ProjectProgramData.projectStatus', ProjectStatus, 'pst', 'pst.id = ProjectProgramData.projectStatusId')
            .leftJoinAndMapOne('ProjectProgramData.dataEntryUser', User, 'deu', 'deu.id = ProjectProgramData.dataEntryUserId')
            .innerJoinAndMapOne('ProjectProgramData.dataRequestStatus', DataRequestStatus, 'st', 'st.id = ProjectProgramData.dataRequestStatusId')
            .innerJoinAndMapOne('ProjectProgramData.projectProgram', ProjectProgramme, 'pp', 'pp.id = ProjectProgramData.projectProgramId')
            .innerJoinAndMapOne('pp.dataSource', Institution, 'in', 'in.id = pp.dataSourceId')
            .where(filter, params)
            .orderBy("ProjectProgramData.editedOn", "DESC");

        return query;
    }

    getRequestsListforHistory(fromyear: number, toYear: number, institutionId: number, dataRequestStatusId: number[]) {
        let filter = "in.id = :institutionId";

        if (fromyear > 0) {
            filter = filter + " AND year >= :fromyear";
        }

        if (toYear > 0) {
            filter = filter + " AND year <= :toyear";
        }

        let params = { institutionId: institutionId, fromyear: fromyear, toyear: toYear };

        if (dataRequestStatusId.length > 0) {
            filter = filter + " AND ProjectProgramData.dataRequestStatusId IN (:...dataRequestStatusId)";
            params["dataRequestStatusId"] = dataRequestStatusId;
        }

        const query = this.repo.createQueryBuilder("ProjectProgramData")
            .leftJoinAndMapOne('ProjectProgramData.projectStatus', ProjectStatus, 'pst', 'pst.id = ProjectProgramData.projectStatusId')
            .leftJoinAndMapOne('ProjectProgramData.dataEntryUser', User, 'deu', 'deu.id = ProjectProgramData.dataEntryUserId')
            .innerJoinAndMapOne('ProjectProgramData.dataRequestStatus', DataRequestStatus, 'st', 'st.id = ProjectProgramData.dataRequestStatusId')
            .innerJoinAndMapOne('ProjectProgramData.projectProgram', ProjectProgramme, 'pp', 'pp.id = ProjectProgramData.projectProgramId')
            .innerJoinAndMapOne('pp.dataSource', Institution, 'in', 'in.id = pp.dataSourceId')
            .where(filter, params)
            .orderBy("ProjectProgramData.editedOn", "DESC");

        return query;
    }

    /**
     * 
     * @param dataRequestStatusId 
     * @param dataSourceId 
     * @param dataEntryUserId 
     */
    getRequestsListOfInstitution(dataRequestStatusId: number[], dataSourceId: number, dataEntryUserId: number) {
        let filter = "pp.dataSourceId = :dataSourceId";
        let params = { dataSourceId: dataSourceId };

        if (dataRequestStatusId.length > 0) {
            filter = filter + " AND ProjectProgramData.dataRequestStatusId IN (:...dataRequestStatusId)";
            params["dataRequestStatusId"] = dataRequestStatusId;
        }

        if (dataEntryUserId != 0) {
            filter = filter + " AND ProjectProgramData.dataEntryUserId = :dataEntryUserId";
            params["dataEntryUserId"] = dataEntryUserId;
        }

        const query = this.repo.createQueryBuilder("ProjectProgramData")
            .leftJoinAndMapOne('ProjectProgramData.projectStatus', ProjectStatus, 'pst', 'pst.id = ProjectProgramData.projectStatusId')
            .leftJoinAndMapOne('ProjectProgramData.dataEntryUser', User, 'deu', 'deu.id = ProjectProgramData.dataEntryUserId')
            .innerJoinAndMapOne('ProjectProgramData.dataRequestStatus', DataRequestStatus, 'st', 'st.id = ProjectProgramData.dataRequestStatusId')
            .innerJoinAndMapOne('ProjectProgramData.projectProgram', ProjectProgramme, 'pp', 'pp.id = ProjectProgramData.projectProgramId')
            .where(filter, params)
            .orderBy("ProjectProgramData.editedOn", "DESC");

        return query;
    }

    /**
     * 
     * @param params 
     */
    async assignToDataEntry(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(ProjectProgramData)
            .set({
                dataEntryUser: params.dataEntryUser,
                dataRequestStatus: params.dataRequestStatus,
                dataEntryDeadline: params.dataEntryDeadline,
                editedOn: new Date()
            })
            .where("id IN (:...ids)", { ids: params.requestIdList })
            .execute();
    }

    /**
     * 
     * @param params 
     */
    async saveProjectData(params: ProjectDataSaveRequest) {

        let fields = {};

        if (params.projectStatus) {
            fields["projectStatus"] = params.projectStatus;
        }

        if (params.projectProgress) {
            fields["projectProgress"] = params.projectProgress;
        }

        if (params.submitForReview) {
            fields["dataRequestStatus"] = params.dataRequestStatus;
        }


        fields["editedOn"] = new Date()

        await this.repo.createQueryBuilder()
            .update(ProjectProgramData)
            .set(fields)
            .where("id = :id", { id: params.projectProgramDataId })
            .execute();
    }

    /**
     * 
     * @param params 
     */
    async approveProjectData(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(ProjectProgramData)
            .set({
                dataRequestStatus: params.dataRequestStatus,
                editedOn: new Date()
            })
            .where("id IN (:...ids)", { ids: params.requestIdList })
            .execute();
    }

    /**
     * 
     * @param params 
     */
    async rejectProjectData(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(ProjectProgramData)
            .set({
                dataRequestStatus: params.dataRequestStatus,
                editedOn: new Date()
            })
            .where("id IN (:...ids)", { ids: params.requestIdList })
            .execute();
    }

    /**
     * 
     * @param params 
     */
    async approveProjectDataFromCCS(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(ProjectProgramData)
            .set({
                dataRequestStatus: params.dataRequestStatus,
                editedOn: new Date()
            })
            .where("id IN (:...ids)", { ids: params.requestIdList })
            .execute();
    }

    /**
     * 
     * @param params 
     */
    async rejectProjectDataFromCCS(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(ProjectProgramData)
            .set({
                dataRequestStatus: params.dataRequestStatus,
                editedOn: new Date()
            })
            .where("id IN (:...ids)", { ids: params.requestIdList })
            .execute();
    }

}