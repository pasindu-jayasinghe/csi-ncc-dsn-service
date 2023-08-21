import { InjectRepository } from '@nestjs/typeorm';
import { User } from './../../users/user.entity';
import { join } from 'path';
import { ProjectProgramData } from './../entity/project-program-data.entity';
import { ProjectProgramDataService } from './project-program-data.service';
import { CreateManyDto, Crud, CrudController, CrudRequest, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { Body, Controller, Get, Post, Query, Req, Request } from '@nestjs/common';
import { ProjectProgramme } from '../entity/project-programme.entity';
import { paginate, Pagination } from 'nestjs-typeorm-paginate';
import { ProjectProgramService } from '../project-program.service';
import { DataRequestStatus, DataRequestStatusEnum } from 'src/masterdata/entity/datarequst-status.entity';
import { MasterdataService } from 'src/masterdata/masterdata.service';
import { DatarequestStatusHistoryService } from 'src/datarequest-status-history/datarequest-status-history.service';
import { Logger } from '@nestjs/common';
import { ProjectDataAssignRequest } from '../dto/project-data-assign-req.dto';
import { ProjectDataSaveRequest } from '../dto/project-data-save-req.dto';
import { Repository } from 'typeorm';
import { request } from 'express';

@Crud({
    model: {
        type: ProjectProgramData,
    },
    query: {
        join: {
            projectProgram: {
                eager: true,
            },
            projectStatus: {
                eager: true,
            },
            dataRequestStatus: {
                eager: true,
            }
        }
    }


})
@Controller('project-program-data')
export class ProjectProgramDataController implements CrudController<ProjectProgramData> {
    constructor(public service: ProjectProgramDataService, private readonly projectProgramService: ProjectProgramService,
        private masterDataService: MasterdataService,
        public dataRequestStatusHistoryService: DatarequestStatusHistoryService,
        @InjectRepository(User)
        private readonly usersRepository: Repository<User>) {

    }

    get base(): CrudController<ProjectProgramData> {
        return this;
    }

    @Get('available-to-request/:page/:limit/:institutionId/:year/:name')
    async getProjectsAvailableForDataRequest(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('year') year: number, @Query('name') name: string): Promise<any> {

        const requestedIdListQry = this.service.getRequestsList(year, institutionId, []);
        const requestedIdListRows = await requestedIdListQry.getRawMany();
        const requestedIdList = requestedIdListRows.map(obj => obj.pp_id);

        const projectsList = this.projectProgramService.getProjectsForDataRequests(requestedIdList, institutionId, name);

        let result = await paginate(projectsList, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Get('requested/:page/:limit/:institutionId/:year/:statusId')
    async getProjectDataRequested(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('year') year: number, @Query('statusId') statusId: number): Promise<any> {
        let statuses = statusId > 0 ? [statusId] : [];
        const requestedIdListQry = this.service.getRequestsList(year, institutionId, statuses);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Get('projectrequesthistory/:page/:limit/:institutionId/:fromyear/:toyear')
    async getRequestsListforHistory(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number,
        @Query('fromyear') fromyear: number, @Query('toyear') toyear: number): Promise<any> {
        const requestedIdListQry = this.service.getRequestsListforHistory(fromyear, toyear, institutionId, [7]);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }



    @Get('institution-requested-data/:page/:limit/:institutionId/:statusId')
    async getProjectDataRequestsOfInstitution(@Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('statusId') statusId: number): Promise<any> {
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
    async getProjectDataRequestsOfDataEntryUser(@Request() request, @Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('statusId') statusId: number, @Query('userId') userId: number): Promise<any> {
        let statuses = statusId > 0 ? [statusId] : [];

        let curentUserId = await this.getCurrentUserId(request);

        const requestedIdListQry = this.service.getRequestsListOfInstitution(statuses, institutionId, curentUserId);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Get('institution-assigned-data/:page/:limit/:institutionId/:userId')
    async getProjectDataRequestsToDataEntry(@Request() request, @Query('page') page: number = 1, @Query('limit') limit: number = 10, @Query('institutionId') institutionId: number, @Query('userId') userId: number): Promise<any> {

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

        let curentUserId = await this.getCurrentUserId(request);

        if (curentUserId == 0) {
            let status3 = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoassign).then(a => {
                return a ? a.id : 0;
            });
            statuses.push(status3);
        }

        const requestedIdListQry = this.service.getRequestsListOfInstitution(statuses, institutionId, curentUserId);
        let result = await paginate(requestedIdListQry, {
            limit: limit,
            page: page
        });
        return result;
    }

    @Override()
    async createMany(@Request() request, @ParsedRequest() req: CrudRequest,
        @ParsedBody() dto: CreateManyDto<ProjectProgramData>): Promise<ProjectProgramData[]> {
        let result: ProjectProgramData[] = [];
        let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoassign).then(a => {
            return a;
        });
        Logger.log(status);
        for (let dataReq of dto.bulk) {
            dataReq.dataRequestStatus = status;
            let newRecord = await this.base.createOneBase(req, dataReq);
            result.push(newRecord);

            //TODO userId should be taken from logged in user
            let userId = 1;
            await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(newRecord, status, request, status.name);
        }

        return result;
    }

    @Post('institution-requested-data/assign')
    async assignToProjectDataEntryUser(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.PendingDataEntry).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.assignToDataEntry(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, status.name);
            }


        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/save')
    async saveProjectData(@Request() request, @Body() dto: ProjectDataSaveRequest): Promise<boolean> {
        let result = true;
        try {

            if (dto.submitForReview) {
                let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoreview).then(a => {
                    return a;
                });
                dto.dataRequestStatus = status;
            }

            await this.service.saveProjectData(dto);

            if (dto.submitForReview) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: dto.projectProgramDataId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, dto.dataRequestStatus, request, dto.dataRequestStatus.name);
            }

        } catch (error) {
            Logger.error(error);
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/approve')
    async approveProjectData(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.SubmittedtoCCS).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.approveProjectData(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, status.name);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/reject')
    async rejectProjectData(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Rejectedandreassigned).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectProjectData(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/approve-from-ccs')
    async approveProjectDataFromCCS(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Publish).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.approveProjectDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/reject-from-ccs')
    async rejectProjectDataFromCCS(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.RejectedfromtheCCS).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectProjectDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/cancel-from-ccs')
    async cancelProjectDataFromCCS(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.CancelfromtheCCS).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectProjectDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            console.log(error);
            result = false;
        }

        return result;
    }

    @Post('institution-requested-data/reject-from-ia')
    async rejectProjectDataFromIA(@Request() request, @Body() dto: ProjectDataAssignRequest): Promise<boolean> {
        let result = true;
        try {

            let status = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.RejectedfromtheIA).then(a => {
                return a;
            });
            dto.dataRequestStatus = status;
            await this.service.rejectProjectDataFromCCS(dto);

            for (let recordId of dto.requestIdList) {
                let record: ProjectProgramData = await this.service.findOne({
                    where: { id: recordId }
                }).then(a => {
                    return a;
                });

                //TODO userId should be taken from logged in user
                await this.dataRequestStatusHistoryService.crateProjectProgramDataStatusHistory(record, status, request, dto.comment);
            }

        } catch (error) {
            result = false;
        }

        return result;
    }


}