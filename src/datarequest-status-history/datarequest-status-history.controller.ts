import { DatarequestStatusHistoryService } from './datarequest-status-history.service';
import { DataRequestStatusHistory } from './../masterdata/entity/datarequst-status-history.entity';
import { Crud, CrudController } from '@nestjsx/crud';
import { Controller, Query, Request, Get } from '@nestjs/common';


@Crud({
    model: {
        type: DataRequestStatusHistory,
    }
})
@Controller('datarequest-status-history')
export class DatarequestStatusHistoryController implements CrudController<DataRequestStatusHistory> {
    constructor(public service: DatarequestStatusHistoryService) {
    }
    @Get('audit/auditinfo/:page/:limit/:featureId/:userId/:fromDate/:toDate')
    async getAuditDetails(@Request() request, @Query('page') page: number,
        @Query('limit') limit: number, @Query('featureId') featureId: number, @Query('userId') userId: number,
        @Query('fromDate') fromDate: Date, @Query('toDate') toDate: Date): Promise<any> {



        return await this.service.getAuditDetails({
            limit: limit,
            page: page
        }, featureId, userId,
            new Date(fromDate).getFullYear() != 1899 ? new Date(fromDate) : null,
            new Date(toDate).getFullYear() != 1899 ? new Date(toDate) : null);
    }


}
