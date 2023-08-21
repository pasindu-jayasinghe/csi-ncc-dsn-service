import { InjectRepository } from '@nestjs/typeorm';
import { User } from './../users/user.entity';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { ParameterLocationDataService } from './parameter-location-data.service';
import { Body, Controller, Post, Get, Query } from '@nestjs/common';
import { log } from 'console';
import moment from 'moment';
import { Pagination } from 'nestjs-typeorm-paginate';
import { Parameter } from './entity/parameter.entity';
import { ParameterLocationService } from './parameter-location.service';
import { ParameterService } from './parameter.service';
import { MasterdataService } from 'src/masterdata/masterdata.service';
import { DataRequestStatusEnum } from 'src/masterdata/entity/datarequst-status.entity';
import { Request } from '@nestjs/common';
import { request } from 'express';
import { Repository } from 'typeorm';


@Crud({
  model: {
    type: Parameter,
  },
  query: {
    join: {
      unitOfMeasure: {
        eager: true,
      },
      unitOfMeasuresFordataEntry: {
        eager: true,
      },
      climateChangeDataCategory: {
        eager: true,

      },
      sector: {
        eager: true,

      },
      subSector: {
        eager: true,

      },
      sectorMoE: {
        eager: true,

      },
      project: {
        eager: true,

      },
      programme: {
        eager: true,

      },
      policy: {
        eager: true,
      },
      frequency: {
        eager: true,
      },
      institution: {
        eager: true,
      },
      deadline: {
        eager: true,
      },
      climateImpact: {
        eager: true,
      },
      parameterDataType: {
        eager: true,
      }

    }
  }
})

@Controller('parameter')
export class ParameterController implements CrudController<Parameter> {

  constructor(public service: ParameterService,
    public parameterLocationService: ParameterLocationService,
    public parameterLocationDataService: ParameterLocationDataService,
    private masterDataService: MasterdataService,
    @InjectRepository(User)
    private readonly usersRepository: Repository<User>) {

  }



  @Get('parameter/NotRequestedParametera/:page/:limit/:frequncyId/:fromDate/:toDate/:insutationId/:paramName')
  async getNotRequestedParametera(@Query('page') page: number = 1,
    @Query('limit') limit: number = 10, @Query('frequncyId') frequncyId: number,
    @Query('fromDate') fromDate: Date, @Query('toDate') toDate: Date, @Query('insutationId') insutationId: number, @Query('paramName') paramName: string): Promise<any> {
    // console.log(moment(fromDate).format('YYYY-MM-DD'));
    return this.parameterLocationService.getNotRequestedParametera({
      limit: limit,
      page: page
    }, frequncyId, new Date(fromDate), new Date(toDate), insutationId, paramName);
  }

  @Get('parameter/RequestedParametera/:page/:limit/:frequncyId/:fromDate/:toDate/:insutationId/:statusId/:paramName')
  async getRequestedParametera(@Query('page') page: number = 1,
    @Query('limit') limit: number = 10, @Query('frequncyId') frequncyId: number,
    @Query('fromDate') fromDate: Date, @Query('toDate') toDate: Date, @Query('insutationId') insutationId: number,
    @Query('paramName') paramName: string, @Query('statusId') statusId: number): Promise<any> {
    return this.parameterLocationDataService.getRequestedParametera({
      limit: limit,
      page: page
    }, frequncyId, new Date(fromDate), new Date(toDate), insutationId, paramName, statusId);
  }


  @Get('parameter/getRequestedParameteraForCCSAdminApprove/:page/:limit/:frequncyId/:insutationId/:fromDate/:toDate')
  async getRequestedParameteraForCCSAdminApprove(@Query('page') page: number,
    @Query('limit') limit: number, @Query('frequncyId') frequncyId: number,
    @Query('fromDate') fromDate: Date = null, @Query('toDate') toDate: Date = null,
    @Query('insutationId') insutationId: number): Promise<any> {

    return this.parameterLocationDataService.getRequestedParameteraForCCSAdminApprove({
      limit: limit,
      page: page
    }, frequncyId, new Date(fromDate).getFullYear() != 1899 ? new Date(fromDate) : null, new Date(toDate).getFullYear() != 1899 ? new Date(toDate) : null, insutationId);
  }


  @Get('parameter/getRequestedParameteraForInstutionAdminApprove/:page/:limit/:insutationId')
  async getRequestedParameteraForInstutionAdminApprove(@Query('page') page: number,
    @Query('limit') limit: number, @Query('insutationId') insutationId: number): Promise<any> {

    return this.parameterLocationDataService.getRequestedParameteraForInstutionAdminApprove({
      limit: limit,
      page: page
    }, insutationId);
  }


  @Get('parameter/getRequestedParameteraForDataEntry/:page/:limit/:insutationId/:userId')
  async getRequestedParameteraForDataEntry(@Request() request, @Query('page') page: number,
    @Query('limit') limit: number, @Query('insutationId') insutationId: number, @Query('userId') userId: number): Promise<any> {

    let curentuserId = await this.getCurrentUser(request);

    console.log("==============================================");
    console.log(curentuserId)


    return this.parameterLocationDataService.getRequestedParameteraForDataEntry({
      limit: limit,
      page: page
    }, insutationId, curentuserId);
  }

  async getCurrentUser(@Request() request) {
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


  @Get('parameter/getRequestedParameteraForHistory/:page/:limit/:fromDate/:toDate/:insutationId')
  async getRequestedParameteraForHistory(@Query('page') page: number,
    @Query('limit') limit: number, @Query('fromDate') fromDate: Date = null, @Query('toDate') toDate: Date = null, @Query('insutationId') insutationId: number): Promise<any> {

    return this.parameterLocationDataService.getRequestedParameteraForHistory({
      limit: limit,
      page: page
    }, new Date(fromDate).getFullYear() != 1899 ? new Date(fromDate) : null, new Date(toDate).getFullYear() != 1899 ? new Date(toDate) : null, insutationId);
  }

  @Get('parameter/getRequestedParameteraForDataAssign/:page/:limit/:insutationId/:statusId')
  async getRequestedParameteraForDataAssign(@Query('page') page: number,
    @Query('limit') limit: number, @Query('insutationId') insutationId: number, @Query('statusId') statusId: number, @Request() req2): Promise<any> {

    return this.parameterLocationDataService.getRequestedParameteraForDataAssign({
      limit: limit,
      page: page
    }, insutationId, statusId);
  }

  @Get('parameter/getRequestedParameteraForDataAssign/:page/:limit/:insutationId/:userId/:statusId')
  async getRequestedParameteraForAssigneddata(@Request() request, @Query('page') page: number,
    @Query('limit') limit: number, @Query('insutationId') insutationId: number,
    @Query('userId') userId: number, @Query('statusId') statusId: number): Promise<any> {

    let curentUserId = await this.getCurrentUser(request);


    return this.parameterLocationDataService.getRequestedParameteraForAssignedData({
      limit: limit,
      page: page
    }, insutationId, curentUserId, statusId);
  }

  @Get('parameter/searchParameterLocationData/:page/:limit/:fromDate/:toDate/:sectorId/:name/:climateChangeCategoryId/:institutionId')
  async searchParameterLocationData(@Query('page') page: number,
    @Query('limit') limit: number, @Query('fromDate') fromDate: string,
    @Query('toDate') toDate: string, @Query('sectorId') sectorId: number, @Query('name') name: string,
    @Query('climateChangeCategoryId') climateChangeCategoryId: number,
    @Query('institutionId') institutionId: number,): Promise<any> {

    return this.parameterLocationDataService.searchParameterLocationData({
      limit: limit,
      page: page
    }, fromDate, toDate, sectorId, name, climateChangeCategoryId, institutionId);
  }


  get base(): CrudController<Parameter> {
    return this;
  }


  @Override()
  async createOne(
    @ParsedRequest() req: CrudRequest,
    @ParsedBody() dto: Parameter,
  ) {
    console.log("req", req);
    console.log("dto", dto);
    let newUserDb = await this.base.createOneBase(req, dto);

    return newUserDb;

  }

  @Post('sync-location')
  async create(@Body() paramter: Parameter): Promise<Parameter> {

    return this.service.updateLocation(paramter);

  }

  @Get('purchase-data/:page/:limit/:fromDate/:toDate/:sectorId/:name/:categoryId/:provinceId/:districtId/:dsId')
  async getDataForPurchase(@Request() req,
    @Query('page') page: number = 1,
    @Query('limit') limit: number = 10,
    @Query('fromDate') fromDate: string,
    @Query('toDate') toDate: string,
    @Query('sectorId') sectorId: number,
    @Query('name') name: string,
    @Query('categoryId') categoryId: number,
    @Query('provinceId') provinceId: number,
    @Query('districtId') districtId: number,
    @Query('dsId') dsId: number): Promise<any> {
    let statusId = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Publish).then(a => {
      return a ? a.id : 0;
    });

    let paginationOptions = { limit: limit, page: page };
    let userEmail = req.user.email;

    //TODO user id should be taken from logged in user
    let result = await this.parameterLocationDataService.getDataForPurchase(paginationOptions, fromDate, toDate, sectorId, name, statusId, categoryId, provinceId, districtId, dsId, userEmail);
    return result;
  }

  @Override()
  async deleteOne(@ParsedRequest() req: CrudRequest) {
    const id = req.parsed.paramsFilter
      .find(f => f.field === 'id' && f.operator === '$eq').value;
    const res = await this.service.softDelete(id);

    this.parameterLocationService.deleteByParameterId(id);


    return res;
  }


}
