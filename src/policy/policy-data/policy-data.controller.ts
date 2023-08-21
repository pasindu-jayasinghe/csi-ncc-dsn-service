import { User } from './../../users/user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Body, Controller, Get, Post, Query, Logger, Request } from "@nestjs/common";
import { Crud, CrudController } from "@nestjsx/crud";
import { paginate } from "nestjs-typeorm-paginate";
import { DatarequestStatusHistoryService } from "src/datarequest-status-history/datarequest-status-history.service";
import { InstitutionService } from "src/institution/institution.service";
import { DataRequestStatusEnum } from "src/masterdata/entity/datarequst-status.entity";
import { MasterdataService } from "src/masterdata/masterdata.service";
import { ProjectDataAssignRequest } from "src/project-program/dto/project-data-assign-req.dto";
import { Repository } from "typeorm";
import { PolicyDataRequest } from "../dto/policy-data-request.dto";
import { PolicyDataSaveRequest } from "../dto/policy-data-save-request.dto";
import { PolicyData } from "../entity/policy-data.entity";
import { PolicyService } from "../policy.service";
import { PolicyDataService } from "./policy-data.service";
import { request } from 'express';

@Crud({
    model: {
        type: PolicyData,
    },
    query: {
        join: {
            policy: {
                eager: true,
            },
            dataRequestStatus: {
                eager: true,
            }
        }
    }

})
@Controller('policy-data')
export class PolicyDataController implements CrudController<PolicyData> {
    constructor(public service: PolicyDataService,
        private readonly policyService: PolicyService,
        private masterDataService: MasterdataService,
        private dataRequestStatusHistoryService: DatarequestStatusHistoryService,
        private institutionService: InstitutionService,
        @InjectRepository(User)
        private readonly usersRepository: Repository<User>) {

    }

    get base(): CrudController<PolicyData> {
        return this;
    }

    @Get('available-to-request/:page/:limit/:year')
    async getInstitutionsAvailableForDataRequest(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('year') year: number): Promise<any> {

        return this.institutionService.getAvailableInstitutionsForPolicyData(page, limit, year);
    }

    @Get('requested/:page/:limit/:institutionId/:year/:statusId')
    async getPolicyDataRequested(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('year') year: number, @Query('statusId') statusId: number): Promise<any> {
        let statuses = statusId > 0 ? [statusId] : [];
        const requestedListQry = this.service.getRequestsList(year, institutionId, statuses);
        let result = await paginate(requestedListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Get('policyrequesthistory/:page/:limit/:institutionId/:fromyear/:toyear')
    async getRequestsListforHistory(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number,
        @Query('fromyear') fromyear: number, @Query('toyear') toyear: number): Promise<any> {
        const requestedIdListQry = this.service.getRequestsListforHistory(fromyear, toyear, institutionId, [7]);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }
    @Post('request')
    async requestForDataByCCS(@Request() req, @Body() request: PolicyDataRequest): Promise<boolean> {

        if (!(request && request.institutionIds && request.year && request.deadline)) {
            Logger.error("requestForDataByCCS Invalid request");
            return false;
        }

        try {
            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoassign).then(a => {
                return a;
            });

            for (let institutionId of request.institutionIds) {
                let policyList = await this.policyService.getByInstitution(institutionId);

                for (let policy of policyList) {

                    let existingReq = await this.service.getByPolicyAndYear(policy.id, request.year);

                    if (!existingReq || existingReq.length == 0) {
                        let record = new PolicyData();
                        record.policy = policy;
                        record.institutionId = institutionId;
                        record.year = request.year;
                        record.requestedDate = new Date();
                        record.deadline = request.deadline;
                        record.dataRequestStatus = status;

                        let newRecord = await this.service.createRequest(record).then(res => { return res });

                        //TODO userId should be taken from logged in user
                        let userId = 1;
                        await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(newRecord, status, req, status.name);
                    }
                }
            }

            return true;
        } catch (error) {
            Logger.error(error);
            return false;
        }
    }

    @Get('institution-requested-data/:page/:limit/:institutionId/:statusId')
    async getPolicyDataRequestsOfInstitution(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('statusId') statusId: number): Promise<any> {
        let statuses = statusId > 0 ? [statusId] : [];
        const requestedIdListQry = this.service.getRequestsListOfInstitution(statuses, institutionId, 0);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    async getCurrentUserId(@Request() request) {
        let userEmail = request.user.email;
        let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail }, });
        let curentuserId = -1;

        //ins admin
        if (currentDBUser.userType.id == 3) {
            curentuserId = 0;
        }
        else if (currentDBUser.userType.id == 4) {
            curentuserId = currentDBUser.id;
        }

        return curentuserId;

    }

    @Get('institution-assigned-data/:page/:limit/:institutionId/:statusId/:userId')
    async getPolicyDataRequestsOfDataEntryUser(@Request() request, @Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('statusId') statusId: number, @Query('userId') userId: number): Promise<any> {
        let statuses = statusId > 0 ? [statusId] : [];

        let curentuserId = await this.getCurrentUserId(request);


        const requestedIdListQry = this.service.getRequestsListOfInstitution(statuses, institutionId, curentuserId);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Get('institution-assigned-data/:page/:limit/:institutionId/:userId')
    async getPolicyDataRequestsToDataEntry(@Request() request, @Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('userId') userId: number): Promise<any> {

        let curentuserId = await this.getCurrentUserId(request);

        let status1 = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.PendingDataEntry).then(a => {
            return a ? a.id : 0;
        });
        let status2 = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Rejectedandreassigned).then(a => {
            return a ? a.id : 0;
        });

        let statuses = [];
        if (status1 > 0) {
            statuses.push(status1);
        }

        if (status2 > 0) {
            statuses.push(status2);
        }

        if (curentuserId == 0) {
            let status3 = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoassign).then(a => {
                return a ? a.id : 0;
            });
            statuses.push(status3);
        }

        const requestedIdListQry = this.service.getRequestsListOfInstitution(statuses, institutionId, curentuserId);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Post('institution-requested-data/assign')
    async assignToPolicyDataEntryUser(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.PendingDataEntry).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.assignToDataEntry(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, status.name);
            }


        } catch (error) {
            console.log("error on institution-requested-data/assign ", error)
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/save')
    async savePolicyData(@Request() request, @Body() dto: PolicyDataSaveRequest): Promise<boolean> {
        let result = true;
        try {

            if (dto.submitForReview) {
                let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoreview).then(a => {
                    return a;
                });
                dto.dataRequestStatus = status;


            }

            await this.service.savePolicyData(dto);

            if (dto.submitForReview) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: dto.policyDataId }
                }).then(a => {
                    return a;
                });

                //https://gitlab.com/techtranz/gov-lk-ncc-dsn/-/issues/41 - Mithun
                if (dto.tempUserId === 0) {
                    dto.tempUserId = 1;
                }

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, dto.dataRequestStatus, request, dto.dataRequestStatus.name);
            }

        } catch (error) {
            console.log(error);
            Logger.error(error);
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/approve')
    async approvePolicyData(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.SubmittedtoCCS).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.approvePolicyData(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, status.name);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/reject')
    async rejectPolicyData(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Rejectedandreassigned).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectPolicyData(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/approve-from-ccs')
    async approvePolicyDataFromCCS(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Publish).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.approvePolicyDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, status.name);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/reject-from-ccs')
    async rejectPolicyDataFromCCS(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.RejectedfromtheCCS).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectPolicyDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/cancel-from-ccs')
    async cancelPolicyDataFromCCS(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.CancelfromtheCCS).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectPolicyDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/reject-from-IA')
    async rejectPolicyDataFromIA(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.RejectedfromtheIA).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectPolicyDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: PolicyData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.cratePolicyDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }
}