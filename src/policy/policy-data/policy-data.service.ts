import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { TypeOrmCrudService } from "@nestjsx/crud-typeorm";
import { exception } from "console";
import { Institution } from "src/institution/institution.entity";
import { DataRequestStatus } from "src/masterdata/entity/datarequst-status.entity";
import { ProjectDataAssignRequest } from "src/project-program/dto/project-data-assign-req.dto";
import { User } from "src/users/user.entity";
import { PolicyDataSaveRequest } from "../dto/policy-data-save-request.dto";
import { PolicyData } from "../entity/policy-data.entity";
import { Policy } from "../entity/policy.entity";

@Injectable()
export class PolicyDataService extends TypeOrmCrudService<PolicyData> {
    constructor(@InjectRepository(PolicyData) repo) {
        super(repo);
    }

    /**
     * 
     * @param year 
     * @param institutionId 
     */
    getRequestsList(year: number, institutionId: number, dataRequestStatusId: number[]) {
        let filter = "PolicyData.year = :year";
        let params = { year: year };

        if (institutionId > 0) {
            filter = filter + " AND in.id = :institutionId";
            params["institutionId"] = institutionId;
        }

        if (dataRequestStatusId.length > 0) {
            filter = filter + " AND PolicyData.dataRequestStatusId IN (:...dataRequestStatusId)";
            params["dataRequestStatusId"] = dataRequestStatusId;
        }

        const query = this.repo.createQueryBuilder("PolicyData")
            .leftJoinAndMapOne('PolicyData.dataEntryUser', User, 'deu', 'deu.id = PolicyData.dataEntryUserId')
            .innerJoinAndMapOne('PolicyData.dataRequestStatus', DataRequestStatus, 'st', 'st.id = PolicyData.dataRequestStatusId')
            .innerJoinAndMapOne('PolicyData.policy', Policy, 'pp', 'pp.id = PolicyData.policyId')
            .innerJoinAndMapOne('pp.formulationInstitution', Institution, 'in', 'in.id = pp.formulationInstitutionId')
            .where(filter, params)
            .orderBy("PolicyData.editedOn", "DESC");

        return query;
    }

    getRequestsListforHistory(fromyear: number, toYear: number, institutionId: number, dataRequestStatusId: number[]) {
        let filter = "in.id = :institutionId";

        console.log(fromyear);
        console.log(toYear);

        if (fromyear > 0) {
            filter = filter + " AND PolicyData.year >= :fromyear";
        }

        if (toYear > 0) {
            filter = filter + " AND PolicyData.year <= :toyear";
        }

        let params = { institutionId: institutionId, fromyear: fromyear, toyear: toYear };

        if (dataRequestStatusId.length > 0) {
            filter = filter + " AND PolicyData.dataRequestStatusId IN (:...dataRequestStatusId)";
            params["dataRequestStatusId"] = dataRequestStatusId;
        }

        const query = this.repo.createQueryBuilder("PolicyData")

            .leftJoinAndMapOne('PolicyData.dataEntryUser', User, 'deu', 'deu.id = PolicyData.dataEntryUserId')
            .innerJoinAndMapOne('PolicyData.dataRequestStatus', DataRequestStatus, 'st', 'st.id = PolicyData.dataRequestStatusId')
            .innerJoinAndMapOne('PolicyData.policy', Policy, 'pp', 'pp.id = PolicyData.policyId')
            .innerJoinAndMapOne('pp.formulationInstitution', Institution, 'in', 'in.id = pp.formulationInstitutionId')
            .where(filter, params)
            .orderBy("PolicyData.editedOn", "DESC");

        // console.log(query.getQueryAndParameters())

        return query;
    }

    /**
     * 
     * @param policyId 
     * @param year 
     */
    async getByPolicyAndYear(policyId: number, year: number) {
        const data = await this.repo.find({ where: { policy: { id: policyId }, year: year } }).then(res => {
            return res;
        });

        return data;
    }

    /**
     * 
     * @param policyData
     */
    createRequest(policyData: PolicyData) {
        return this.repo.save(policyData).then(res => { return res });
    }

    /**
     * 
     * @param dataRequestStatusId 
     * @param institutionId 
     * @param dataEntryUserId 
     */
    getRequestsListOfInstitution(dataRequestStatusId: number[], institutionId: number, dataEntryUserId: number) {
        let filter = "PolicyData.institutionId = :institutionId";
        let params = { institutionId: institutionId };

        if (dataRequestStatusId.length > 0) {
            filter = filter + " AND PolicyData.dataRequestStatusId IN (:...dataRequestStatusId)";
            params["dataRequestStatusId"] = dataRequestStatusId;
        }

        if (dataEntryUserId != 0) {
            filter = filter + " AND PolicyData.dataEntryUserId = :dataEntryUserId";
            params["dataEntryUserId"] = dataEntryUserId;
        }

        const query = this.repo.createQueryBuilder("PolicyData")
            .leftJoinAndMapOne('PolicyData.dataEntryUser', User, 'deu', 'deu.id = PolicyData.dataEntryUserId')
            .innerJoinAndMapOne('PolicyData.dataRequestStatus', DataRequestStatus, 'st', 'st.id = PolicyData.dataRequestStatusId')
            .innerJoinAndMapOne('PolicyData.policy', Policy, 'pp', 'pp.id = PolicyData.policyId')
            .where(filter, params)
            .orderBy("PolicyData.editedOn", "DESC");


        return query;
    }

    /**
     * 
     * @param params 
     */
    async assignToDataEntry(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(PolicyData)
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
    async savePolicyData(params: PolicyDataSaveRequest) {

        let fields = {};

        if (params.amendments) {
            fields["amendments"] = params.amendments;
        }

        if (params.submitForReview) {
            fields["dataRequestStatus"] = params.dataRequestStatus;
        }

        fields["editedOn"] = new Date();


        await this.repo.createQueryBuilder()
            .update(PolicyData)
            .set(fields)
            .where("id = :id", { id: params.policyDataId })
            .execute().catch(a => {
                console.log(a);
            });
    }

    /**
     * 
     * @param params 
     */
    async approvePolicyData(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(PolicyData)
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
    async rejectPolicyData(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(PolicyData)
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
    async approvePolicyDataFromCCS(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(PolicyData)
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
    async rejectPolicyDataFromCCS(params: ProjectDataAssignRequest) {
        await this.repo.createQueryBuilder()
            .update(PolicyData)
            .set({
                dataRequestStatus: params.dataRequestStatus,
                editedOn: new Date()

            })
            .where("id IN (:...ids)", { ids: params.requestIdList })
            .execute();
    }
}