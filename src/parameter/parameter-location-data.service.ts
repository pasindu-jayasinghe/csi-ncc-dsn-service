import { ParameterDataType } from './entity/parameter-data-type.entity';
import { Sector } from './entity/sector.entity';
import { User } from 'src/users/user.entity';
import { DataRequestStatus, DataRequestStatusEnum } from './../masterdata/entity/datarequst-status.entity';
import { DivisionalSecretariat } from 'src/masterdata/entity/divisional.secretariat.entity';
import { District } from 'src/masterdata/entity/district.entity';
import { Province } from 'src/masterdata/entity/provice.entity';
import { ParameterLocation } from './entity/parameter-location.entity';
import { Institution } from './../institution/institution.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { IPaginationOptions, paginate, Pagination } from 'nestjs-typeorm-paginate';
//ParameterLocation
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ParameterLocationData } from './entity/parameter-location-data.entity';
import { Parameter } from './entity/parameter.entity';
import { Frequency } from 'src/masterdata/entity/frequency.entity';
import { log } from 'console';
import { MasterdataService } from 'src/masterdata/masterdata.service';
import { PurchaseParameterDataRecordDto } from './dto/purchase-parameter-data-record.dto';
import { Logger } from '@nestjs/common';
import { CustomPaginateResponse } from './dto/custom-paginate-response.dto';
import * as moment from 'moment';
import { Userv2Service } from 'src/userv2/userv2.service';
import { ShoppingCartItemService } from 'src/finance/service/shopping-cart-item.service';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { UomConversion } from 'src/masterdata/uom-conversion/entity/uom-conversion.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ParameterLocationDataService extends TypeOrmCrudService<ParameterLocationData> {
  constructor(@InjectRepository(ParameterLocationData) repo,
    @InjectRepository(UomConversion)
    private readonly umcRepository: Repository<UomConversion>,
    private shoppingCartItemService: ShoppingCartItemService,
    public userService: Userv2Service,
    private masterDataService: MasterdataService) {
    super(repo);
  }

  async getRequestedParametera(options: IPaginationOptions, frequncyId: number, fromDate: Date, toDate: Date, insutationId: number,
    paramName: string, statusId: number): Promise<Pagination<ParameterLocationData>> {

    let filter: string = 'p.frequencyId = :frequncyId and DATE(pld.startDate) = :fromDate and DATE(pld.endDate) = :toDate';
    let fDate = `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}`;
    let tDate = `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}`;


    if (insutationId != 0) {
      filter = filter + ' and pl.dataSourceId = :insutationId'
    }

    if (statusId != 0) {
      filter = filter + ' and pld.dataRequestStatusId = :statusId'
    }

    if (paramName != null && paramName != undefined && paramName != "") {
      filter = filter + ' and  p.name LIKE :paramName'
    }

    let data = this.repo.createQueryBuilder("pld")

      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pl.provinceId = pr.id')
      .leftJoinAndMapOne('pl.district', District, 'd', 'pl.districtId = d.id')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'pl.divisionalSecretariatId = ds.id')
      .leftJoinAndMapOne('pl.province', Province, 'prv', 'prv.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds2', 'ds2.id = pl.divisionalSecretariatId')

      .where(filter, { frequncyId: frequncyId, insutationId: insutationId, fromDate: fDate, toDate: tDate, paramName: `%${paramName}%`, statusId: statusId }).orderBy("pld.dataEnteryDeadline");;

    //console.log(data.getQueryAndParameters());
    let resualt = await paginate(data, options);
    return resualt;
  }

  async getRequestedParameteraForCCSAdminApprove(options: IPaginationOptions, frequncyId: number, fromDate: Date, toDate: Date, insutationId: number): Promise<Pagination<ParameterLocationData>> {


    let filter: string = 'pld.dataRequestStatusId in (2,9)';
    let fDate = fromDate != null ? `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}` : null;
    let tDate = toDate != null ? `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}` : null;
    //6 - Submitted to CCS

    if (insutationId != 0) {
      filter = `${filter}  and pl.dataSourceId = :insutationId`;
    }
    if (frequncyId != 0) {
      filter = `${filter} and  p.frequencyId = :frequncyId`;
    }
    if (fDate != null) {
      filter = `${filter} and  DATE(pld.startDate) = :fromDate and DATE(pld.endDate) = :toDate`;
    }
    if (toDate != null) {
      filter = `${filter} and DATE(pld.endDate) = :toDate`;
    }



    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pr.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pl.divisionalSecretariatId')

      .where(filter, { insutationId, frequncyId, fromDate: fDate, toDate: tDate }).orderBy("pld.dataEnteryDeadline");
    // .leftJoinAndMapOne('pl.province', Province, 'pr', 'pl.provinceId = pr.id')
    // .leftJoinAndMapOne('pl.district', District, 'd', 'pl.districtId = d.id')
    // .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'pl.divisionalSecretariatId = ds.id');
    // console.log(data.getQueryAndParameters());
    let resualt = await paginate(data, options);
    return resualt;
  }

  async getRequestedParameteraForInstutionAdminApprove(options: IPaginationOptions, insutationId: number): Promise<Pagination<ParameterLocationData>> {

    let filter: string;
    //6 - Need to Review
    filter = 'pl.dataSourceId = :insutationId  and ( pld.dataRequestStatusId in (6))';


    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('pld.unitOfMeasureDataEntry', UnitOfMeasure, 'umd', 'umd.id = pld.unitOfMeasureDataEntryId')
      .leftJoinAndMapOne('pld.conversionUOMeDataEntry', UomConversion, 'umc', 'umc.id = pld.conversionUOMeDataEntryId')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pr.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pl.divisionalSecretariatId')
      .where(filter, { insutationId: insutationId }).orderBy("pld.dataEnteryDeadline");


    const minsubquery = await this.repo.createQueryBuilder("pld")
      .select('`pld`.id', 'pldid')
      .addSelect('`pld`.parameterLocationId', 'pldparameterLocationId')
      .addSelect('min(`pld`.value)', 'pldvalue')
      .where('`pld`.value is not null and dataRequestStatusId = 7')
      .groupBy('`pld`.parameterLocationId');

    const minMainsubquery = await this.repo.createQueryBuilder("x")
      .select('`x`.id', 'id')
      .addSelect('`x`.parameterLocationId', 'parameterLocationId')
      .addSelect('`x`.value', 'value')
      .innerJoin('(' + minsubquery.getQuery() + ')', 'jointable', '`x`.parameterLocationId = `jointable`.pldparameterLocationId and `jointable`.pldvalue = `x`.value')
      .getRawMany();


    const maxsubquery = await this.repo.createQueryBuilder("pld")
      .select('id', 'pid')
      .addSelect('parameterLocationId', 'pparameterLocationId')
      .addSelect('max(value)', 'pvalue')
      .where('value is not null and dataRequestStatusId = 7')
      .groupBy('parameterLocationId');



    const maxMainsubquery = await this.repo.createQueryBuilder("x")
      .select('id', 'xid')
      .addSelect('parameterLocationId', 'xparameterLocationId')
      .addSelect('value', 'xvalue')
      .innerJoin('(' + maxsubquery.getQuery() + ')', 'jointable', 'parameterLocationId = `jointable`.pparameterLocationId and `jointable`.pvalue = value')
      .getRawMany();

    let resualt = await paginate(data, options);

    if (resualt) {
      for (const r of resualt.items) {
        if (r) {
          let min: number = null;
          let minVal = minMainsubquery.find(a => a.parameterLocationId === r.parameterLocation.id);

          if (minVal === null || minVal === undefined) {
            min = parseInt(r.parameterLocation.parameter?.minSampleValue);
          }
          else {
            let temmin = minVal.value;
            if (r.parameter.minSampleValue != null && r.parameter.minSampleValue != undefined
              && !Number.isNaN(parseInt(r.parameter.minSampleValue))) {
              temmin = minVal.value < r.parameter.minSampleValue ? minVal.value : r.parameter.minSampleValue;
            }
            min = Number.isNaN(parseInt(temmin)) ? 0 : parseInt(temmin);
          }


          let max: number = null;
          let maxVal = maxMainsubquery.find(a => a.xparameterLocationId === r.parameterLocation.id);


          if (maxVal === null || maxVal === undefined) {
            max = parseInt(r.parameter.maxSampleValue);
          }
          else {
            let tempmax = maxVal.xvalue;
            if (r.parameter.maxSampleValue !== null && r.parameter.maxSampleValue !== undefined) {
              tempmax = maxVal.xvalue > r.parameter.maxSampleValue ? maxVal.xvalue : r.parameter.maxSampleValue;
            }
            max = parseInt(tempmax);
          }

          r.historicalMaximum = max;
          r.historicalMinimum = min;
        }
      }



      return resualt;

    }


    return resualt;
  }

  async getRequestedParameteraForDataEntry(options: IPaginationOptions, insutationId: number, userId: number): Promise<Pagination<ParameterLocationData>> {

    let filter: string;
    //3 - Pending Data Entry
    //4 - Rejected and reassigned 
    if (userId != 0) {
      filter = 'pl.dataSourceId = :insutationId and ( pld.dataRequestStatusId in (3,4))';
    }
    else {
      filter = 'pl.dataSourceId = :insutationId and ( pld.dataRequestStatusId in (1,3,4))';
    }

    if (userId != 0) {
      filter = `${filter}  and pld.dataEntryUserId = :userId`;
    }


    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .leftJoinAndMapOne('pld.conversionUOMeDataEntry', UomConversion, 'umc', 'umc.id = pld.conversionUOMeDataEntryId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.parameter', Parameter, 'plp', 'plp.id = pl.parameterId')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pr.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pl.divisionalSecretariatId')

      .where(filter, { insutationId: insutationId, userId: userId }).orderBy("pld.dataEnteryDeadline", "DESC");


    const minsubquery = await this.repo.createQueryBuilder("pld")
      .select('`pld`.id', 'pldid')
      .addSelect('`pld`.parameterLocationId', 'pldparameterLocationId')
      .addSelect('min(`pld`.value)', 'pldvalue')
      .where('`pld`.value is not null and dataRequestStatusId = 7')
      .groupBy('`pld`.parameterLocationId');

    const minMainsubquery = await this.repo.createQueryBuilder("x")
      .select('`x`.id', 'id')
      .addSelect('`x`.parameterLocationId', 'parameterLocationId')
      .addSelect('`x`.value', 'value')
      .innerJoin('(' + minsubquery.getQuery() + ')', 'jointable', '`x`.parameterLocationId = `jointable`.pldparameterLocationId and `jointable`.pldvalue = `x`.value')
      .getRawMany();


    const maxsubquery = await this.repo.createQueryBuilder("pld")
      .select('id', 'pid')
      .addSelect('parameterLocationId', 'pparameterLocationId')
      .addSelect('max(value)', 'pvalue')
      .where('value is not null and dataRequestStatusId = 7')
      .groupBy('parameterLocationId');



    const maxMainsubquery = await this.repo.createQueryBuilder("x")
      .select('id', 'xid')
      .addSelect('parameterLocationId', 'xparameterLocationId')
      .addSelect('value', 'xvalue')
      .innerJoin('(' + maxsubquery.getQuery() + ')', 'jointable', 'parameterLocationId = `jointable`.pparameterLocationId and `jointable`.pvalue = value')
      .getRawMany();



    let resualt = await paginate(data, options);

    let umcList = await this.umcRepository.find();
    // console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    // console.log(umcList);
    // 



    if (resualt) {
      for (const r of resualt.items) {
        if (r) {


          if (umcList) {
            r.uomConversions = r.parameter.unitOfMeasure ? umcList.filter(a => a.unitOfMeasure?.id == r.parameter.unitOfMeasure?.id && a.conversionValue > 0) : new Array();
            r.conversionUOMeDataEntry = r.conversionUOMeDataEntry ? umcList.find(a => a.id == r.conversionUOMeDataEntry.id)
              : r.parameter.unitOfMeasure ? umcList.find(a => a.unitOfMeasure.id == r.parameter.unitOfMeasure.id && a.relatedUnitOfMeasure.id == r.parameter.unitOfMeasure.id) : null;
            r.unitOfMeasureDataEntry = r.conversionUOMeDataEntry?.relatedUnitOfMeasure;
            //with UOM convertion we hide dataEntryValue fild from UI, so we assign value to dataEntryValue 
            //rejected records only has value. 
            r.dataEntryValue = parseInt(r.value) > 0 ? parseInt(r.value) : undefined;
          }

          let min: number = null;
          let minVal = minMainsubquery.find(a => a.parameterLocationId === r.parameterLocation.id);
          console.log(minVal);

          if (minVal === null || minVal === undefined) {
            min = parseInt(r.parameterLocation.parameter?.minSampleValue);
          }
          else {
            let temmin = minVal.value;
            if (r.parameterLocation.parameter.minSampleValue != null && r.parameterLocation.parameter.minSampleValue != undefined
              && !Number.isNaN(Number.parseFloat(r.parameterLocation.parameter.minSampleValue))) {
              temmin = Math.min(Number.parseFloat(minVal.value), Number.parseFloat(r.parameterLocation.parameter.minSampleValue))
            }
            min = Number.isNaN(parseInt(temmin)) ? 0 : parseInt(temmin);
          }


          let max: number = null;
          let maxVal = maxMainsubquery.find(a => a.xparameterLocationId === r.parameterLocation.id);


          if (maxVal === null || maxVal === undefined) {
            max = parseInt(r.parameterLocation.parameter.maxSampleValue);
          }
          else {
            let tempmax = maxVal.xvalue;
            if (r.parameterLocation.parameter.maxSampleValue !== null && r.parameterLocation.parameter.maxSampleValue !== undefined &&
              !isNaN(Number.parseFloat(r.parameterLocation.parameter.maxSampleValue))) {
              // tempmax = maxVal.xvalue > r.parameterLocation.parameter.maxSampleValue ? maxVal.xvalue : r.parameterLocation.parameter.maxSampleValue;
              tempmax = Math.max(Number.parseFloat(maxVal.xvalue), Number.parseFloat(r.parameterLocation.parameter.maxSampleValue))
            }
            max = parseInt(tempmax);
          }

          r.historicalMaximum = max;
          r.historicalMinimum = min;
        }
      }



      return resualt;

    }
  }


  async getRequestedParameteraForAssignedData(options: IPaginationOptions, insutationId: number, userId: number, statusId: number): Promise<Pagination<ParameterLocationData>> {

    let filter: string;
    filter = 'pl.dataSourceId = :insutationId ';

    if (userId != 0) {
      filter = `${filter}  and pld.dataEntryUserId = :userId`;
    }

    if (statusId != 0) {
      filter = `${filter} and pld.dataRequestStatusId = :statusId`;
    }

    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pr.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pl.divisionalSecretariatId')

      .where(filter, { insutationId: insutationId, userId: userId, statusId }).orderBy("pld.dataEnteryDeadline", "DESC")
      .orderBy("pld.editedOn", "DESC");

    console.log("getRequestedParameteraForAssignedData1111");
    //console.log(data.getQueryAndParameters())

    let resualt = await paginate(data, options);
    return resualt;
  }

  async getRequestedParameteraForHistory(options: IPaginationOptions, fromDate: Date, toDate: Date, insutationId: number): Promise<Pagination<ParameterLocationData>> {

    let filter: string;
    filter = 'pl.dataSourceId = :insutationId and pld.dataRequestStatusId in (7)';


    let fDate = fromDate ? `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}` : null;
    let tDate = toDate ? `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}` : null;

    if (fDate != null) {
      filter = filter + 'and DATE(pld.startDate) >= :fDate'
    }
    if (tDate != null) {
      filter = filter + ' and DATE(pld.endDate) <= :tDate'
    }

    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pr.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pl.divisionalSecretariatId')
      .where(filter, { insutationId: insutationId, fDate, tDate })
      .orderBy("pld.editedOn", "DESC");

    //console.log("getRequestedParameteraForAssignedData222");


    let resualt = await paginate(data, options);
    return resualt;
  }

  async getRequestedParameteraForDataAssign(options: IPaginationOptions, insutationId: number, statusId: number): Promise<Pagination<ParameterLocationData>> {

    let filter: string;
    filter = 'pl.dataSourceId = :insutationId';

    if (statusId != 0) {
      filter = `${filter} and pld.dataRequestStatusId = :statusId`;
    }
    // let fDate = `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}`;
    // let tDate = `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}`;


    // if (insutationId != 0) {
    //   filter = 'pl.dataSourceId = :insutationId and p.frequencyId = :frequncyId and DATE(pld.startDate) = :fromDate and DATE(pld.endDate) = :toDate'
    // }
    // else {
    //   filter = 'p.frequencyId = :frequncyId and DATE(pld.startDate) = :fromDate and DATE(pld.endDate) = :toDate'
    // }
    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('pld.dataEntryUser', User, 'u', 'pld.dataEntryUserId = u.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pr.id = pl.provinceId')
      .leftJoinAndMapOne('pl.district', District, 'di', 'di.id = pl.districtId')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'ds.id = pl.divisionalSecretariatId')


      .where(filter, { insutationId: insutationId, statusId })
      .orderBy("pld.editedOn", "DESC");

    // .leftJoinAndMapOne('pl.province', Province, 'pr', 'pl.provinceId = pr.id')
    // .leftJoinAndMapOne('pl.district', District, 'd', 'pl.districtId = d.id')
    // .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'pl.divisionalSecretariatId = ds.id');
    let resualt = await paginate(data, options);
    return resualt;
  }

  /**
   * search data
   * @param options 
   * @param fromDate 
   * @param toDate 
   * @param sectorId 
   * @param name 
   * @param climateChangeCategoryId 
   */
  async searchParameterLocationData(options: IPaginationOptions, fromDate: string, toDate: string,
    sectorId: number, name: string, climateChangeCategoryId: number, institutionId: number) {
    let dataRequestStatusId = await this.masterDataService.getDataRequsetStatus(DataRequestStatusEnum.Publish).then(a => {
      return a ? a.id : 0;
    });

    let filter = "dc.id = :climateChangeCategoryId AND drs.id = :dataRequestStatusId";
    let params = { climateChangeCategoryId: climateChangeCategoryId, dataRequestStatusId: dataRequestStatusId };

    if (fromDate) {
      filter = `${filter} AND pld.startDate >= :fromDate`;
      params["fromDate"] = fromDate
    }

    if (institutionId > 0) {
      filter = `${filter} AND pl.dataSourceId = :institutionId`;
      params["institutionId"] = institutionId
    }

    if (toDate) {
      filter = `${filter} AND pld.endDate <= :toDate`;
      params["toDate"] = toDate
    }

    if (sectorId > 0) {
      filter = `${filter} AND p.sectorId = :sectorId`;
      params["sectorId"] = sectorId
    }

    if (name) {
      filter = `${filter} AND p.name LIKE :name`;
      params["name"] = `%${name}%`
    }

    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .innerJoinAndMapOne('p.sector', Sector, 'ps', 'p.sectorId = ps.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.climateChangeDataCategory', ClimateChangeDataCategory, 'dc', 'p.climateChangeDataCategoryId = dc.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .where(filter, params);

    let res = await paginate(data, options);

    for (const obj of res.items) {
      let duration = "";
      if (obj.startDate) {
        duration = moment(new Date(obj.startDate)).format("MM/DD/YYYY");
      }
      if (obj.endDate) {
        duration = duration + " - " + moment(new Date(obj.endDate)).format("MM/DD/YYYY");
      }

      obj.validTimeDuration = duration;
    }



    return res;
  }

  /**
   * 
   * @param options 
   * @param fromDate 
   * @param toDate 
   * @param sectorId 
   * @param name 
   * @param dataRequestStatusId 
   * @param userId 
   */
  async getDataForPurchase(options: IPaginationOptions, fromDate: string, toDate: string, sectorId: number, name: string, dataRequestStatusId: number, categoryId: number, provinceId: number, districtId: number, dsId: number, userEmail: string) {

    let filter = "pld.dataRequestStatusId = :dataRequestStatusId";
    let params = { dataRequestStatusId: dataRequestStatusId };

    if (fromDate) {
      filter = `${filter} AND pld.startDate >= :fromDate`;
      params["fromDate"] = fromDate;
    }

    if (toDate) {
      filter = `${filter} AND pld.endDate <= :toDate`;
      params["toDate"] = toDate;
    }

    if (sectorId > 0) {
      filter = `${filter} AND p.sectorId = :sectorId`;
      params["sectorId"] = sectorId;
    }

    if (name) {
      filter = `${filter} AND p.name LIKE :name`;
      params["name"] = `%${name}%`;
    }

    if (categoryId > 0) {
      filter = `${filter} AND p.climateChangeDataCategoryId = :categoryId`;
      params["categoryId"] = categoryId;
    }

    // if (provinceId > 0 && districtId == 0 && dsId == 0) {
    //   filter = `${filter} AND pl.provinceId = :provinceId`;
    //   params["provinceId"] = provinceId;
    // } else if (provinceId > 0 && districtId > 0 && dsId == 0) {
    //   filter = `${filter} AND pl.districtId = :districtId`;
    //   params["districtId"] = districtId;
    // } else if (provinceId > 0 && districtId > 0 && dsId > 0) {
    //   filter = `${filter} AND pl.divisionalSecretariatId = :dsId`;
    //   params["dsId"] = dsId;
    // }


    if (dsId > 0) {
      filter = `${filter} AND pl.divisionalSecretariatId = :dsId`;
      params["dsId"] = dsId;
    } else if (provinceId > 0 && districtId > 0) {
      filter = `${filter} AND pl.districtId = :districtId`;
      params["districtId"] = districtId;
    } else if (provinceId > 0) {
      filter = `${filter} AND pl.provinceId = :provinceId`;
      params["provinceId"] = provinceId;
    }


    filter = `${filter} AND p.isPublicData is not NULL `;

    let data = this.repo.createQueryBuilder("pld")
      .innerJoinAndMapOne('pld.parameter', Parameter, 'p', 'pld.parameterId = p.id')
      .leftJoinAndMapOne('p.parameterDataType', ParameterDataType, 'pdt', 'p.parameterDataTypeId = pdt.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('p.frequency', Frequency, 'f', 'p.frequencyId = f.id')
      .innerJoinAndMapOne('pld.parameterLocation', ParameterLocation, 'pl', 'pld.parameterLocationId = pl.id')
      .leftJoinAndMapOne('pld.dataRequestStatus', DataRequestStatus, 'drs', 'pld.dataRequestStatusId = drs.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pl.provinceId = pr.id')
      .leftJoinAndMapOne('pl.district', District, 'd', 'pl.districtId = d.id')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'pl.divisionalSecretariatId = ds.id')
      .where(filter, params);

    //Logger.log(data.getQueryAndParameters());
    let res = await paginate(data, options);
    //Logger.log(res);
    let result = new CustomPaginateResponse();

    result.items = [];
    for (let obj of res.items) {
      let record = await this.mapObjectToPurchaseRecord(obj, userEmail);
      result.items.push(record);
    }
    result.totalRecords = res.meta.totalItems;
    return result;
  }

  /**
   * 
   * @param obj 
   */
  async mapObjectToPurchaseRecord(obj: any, userEmail: string) {
    let record = new PurchaseParameterDataRecordDto();
    record.parameterDataId = obj.id;
    record.parameterId = obj.parameter?.id;
    record.name = obj.parameter?.name;
    record.description = obj.parameter?.description;
    record.parameterDataType = obj.parameter?.parameterDataType;

    let location = { isNational: obj.parameterLocation.isNational };

    if (obj.parameterLocation && obj.parameterLocation.province) {
      location["province"] = obj.parameterLocation.province.name;
    }

    if (obj.parameterLocation && obj.parameterLocation.district) {
      location["district"] = obj.parameterLocation.district.name;
    }

    if (obj.parameterLocation && obj.parameterLocation.divisionalSecretariat) {
      location["ds"] = obj.parameterLocation.divisionalSecretariat.name;
    }

    record.location = location;
    record.dataProvider = obj.parameterLocation?.dataSource?.name;

    record.isInActiveCart = await this.shoppingCartItemService.isItemInActiveCart(userEmail, record.parameterDataId);
    record.isAlreadyPurchased = await this.shoppingCartItemService.hasAlreadyPaidForItem(userEmail, record.parameterDataId);

    if (obj.parameter.isPublicData) {
      record.value = obj.value;
    } else {
      // if (record.isAlreadyPurchased) {
      //   record.value = obj.value;
      // } else {
        record.value = obj.parameter.sampleParamterReading;
      //}
    }

    record.unit = obj.parameter.unitOfMeasure?.name;

    let duration = "";
    if (obj.startDate) {
      duration = moment(new Date(obj.startDate)).format("MM/DD/YYYY");
      record.dataValidFrom = obj.startDate;
    }
    if (obj.endDate) {
      duration = duration + " - " + moment(new Date(obj.endDate)).format("MM/DD/YYYY");
      record.dataValidTo = obj.endDate;
    }

    record.validTimeDuration = duration;
    record.isPublicData = obj.parameter.isPublicData;
    record.commercialValue = obj.parameter.commercialValue;
    record.frequency = obj.parameter.frequency?.name;

    return record;
  }

}
