import { User } from './../users/user.entity';
import { MasterdataService } from './../masterdata/masterdata.service';
import { DataRequestStatus, DataRequestStatusEnum } from './../masterdata/entity/datarequst-status.entity';
import { DatarequestStatusHistoryService } from './../datarequest-status-history/datarequest-status-history.service';
import { Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
//parameter-location.service
import { Controller, Request } from '@nestjs/common';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse } from '@nestjsx/crud';
import { ClimateChangeDataCategoryService } from './climate-change-data-category.service';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { ParameterLocationData } from './entity/parameter-location-data.entity';
import { ParameterLocation } from './entity/parameter-location.entity';
import { Parameter } from './entity/parameter.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterLocationDataService } from './parameter-location-data.service';
import { ParameterLocationService } from './parameter-location.service';
import { ParameterService } from './parameter.service';
import { UnitOfMeasureService } from './unitofmeasure.service';
import { Console } from 'console';
import { UsersService } from 'src/users/users.service';
import { EmailNitificationService } from 'src/notifications/email.notification.service';
import { Userv2Service } from 'src/userv2/userv2.service';


@Crud({
    model: {
        type: ParameterLocationData,
    },

})

@Controller('parameter-location-data')
export class ParameterLocationDataController implements CrudController<ParameterLocationData> {

    constructor(public service: ParameterLocationDataService, public datarequestStatusHistoryService: DatarequestStatusHistoryService,
        public masterdataService: MasterdataService, private usersService: Userv2Service,
        private meailService: EmailNitificationService,
        private paramterService: ParameterService) {

    }

    get base(): CrudController<ParameterLocationData> {
        return this;
    }

    @Override()
    async updateOne(@Request() request, @ParsedRequest() req: CrudRequest, @ParsedBody() dto: ParameterLocationData) {

        let status: DataRequestStatus = dto.dataRequestStatus;
        // await this.masterdataService.getDataRequsetStatus(DataRequestStatusEnum.PendingDataEntry).then(a => {
        //     status = a;
        // });
        dto.editedOn = new Date();
        let updateData = await this.base.updateOneBase(req, dto);

        let userId = 1;

        let historyComment: string = status.name;
        if (status.id == DataRequestStatusEnum.Needtoreview) {
            // console.log(dto.unitOfMeasureDataEntry?.name);
            // console.log(dto.conversionUnitOfMeasurevalue);
            // console.log(dto.parameter.unitOfMeasure?.name);
            // console.log(dto.conversionUOMeDataEntry?.conversionValue);

            if (dto.unitOfMeasureDataEntry) {
                historyComment = `Data Entry Unit : ${dto.unitOfMeasureDataEntry?.name},
             Data Entry Value : ${dto.conversionUnitOfMeasurevalue},
             Multiplication Factor : ${dto.conversionUOMeDataEntry?.conversionValue}
             Requested Unit : ${dto.parameter.unitOfMeasure?.name}, 
             Requested Value : ${dto.value}`;
            }

            userId = dto.dataEntryUser ? dto.dataEntryUser.id : 1;

            // console.log("================" + dto.reasonforExceedRange + "===================");
            historyComment = dto.reasonforExceedRange ? dto.reasonforExceedRange + ', ' + historyComment : historyComment;

            historyComment = dto.contentComment ? "Content Comment : " + dto.contentComment : historyComment;

            console.log("==========================================");
            console.log(dto.contentComment);
            console.log(historyComment);
        }
        else if (status.id == DataRequestStatusEnum.RejectedfromtheCCS
            || status.id == DataRequestStatusEnum.Rejectedandreassigned
            || status.id == DataRequestStatusEnum.CancelfromtheCCS
            || status.id == DataRequestStatusEnum.RejectedfromtheIA) {
            historyComment = dto.comment;
        }
        if (status.id == DataRequestStatusEnum.PendingDataEntry || status.id == DataRequestStatusEnum.Rejectedandreassigned) {

            this.meailService.sendnewDataEntryRequesteEmailParameter(dto);
        }
        this.datarequestStatusHistoryService.crateStatusHistory(updateData, status, request, historyComment);

    }

    @Override()
    async createOne(@Request() request,
        @ParsedRequest() req: CrudRequest,
        @ParsedBody() dto: ParameterLocationData,
    ) {
        let status: DataRequestStatus = null;
        await this.masterdataService.getDataRequsetStatus(DataRequestStatusEnum.Needtoassign).then(a => {
            status = a;
        });
        dto.dataRequestStatus = status;
        console.log("========================1=====================");

        let newplData = await this.base.createOneBase(req, dto);

        console.log("========================2=====================");


        console.log("new pld email send just b4 fired.")

        this.meailService.sendnewDataRequesteEmailParameter(dto);

        console.log("new pld email send just fired.")

        let userId = 1;

        this.datarequestStatusHistoryService.crateStatusHistory(newplData, status, request, status.name);
    }


}