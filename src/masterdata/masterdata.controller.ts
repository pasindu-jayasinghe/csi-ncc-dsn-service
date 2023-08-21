import { ClimateImpact } from './entity/climate-Impact.entity';
import { Deadline } from './entity/deadline.entity';
import { DataRequestStatusHistory } from 'src/masterdata/entity/datarequst-status-history.entity';
import { SDBenefit } from './entity/sd-benefit.entity';
import { SubSector } from './../parameter/entity/sub.sector.entity';
import { Sector } from './../parameter/entity/sector.entity';
import { ClimateChangeDataCategory } from './../parameter/entity/climate.change.data.category.entity';
import { ProjectType } from './../project-program/entity/project-type.entity';

import { Body, Controller, Get, Param, Put, Query, Res } from '@nestjs/common';
import { MasterdataService } from './masterdata.service';
import { InstitutionCategory } from 'src/institution/institution.category.entity';
import { Province } from './entity/provice.entity';
import { District } from './entity/district.entity';
import { DivisionalSecretariat } from './entity/divisional.secretariat.entity';
import { InstitutionType } from 'src/institution/institution.type.entity';
import { Currency } from './entity/currency.entity';
import { FinancingScheme } from './entity/financing-scheme.entity';
import { Frequency } from './entity/frequency.entity';
import { DataRequestStatus } from './entity/datarequst-status.entity';
import { Hierarchy } from './entity/Hierarchy.entity';
import { ParameterDataType } from 'src/parameter/entity/parameter-data-type.entity';
import { DataUsageCategory } from 'src/users/data-usage-category.entity';

const { v4: uuidv4 } = require('uuid');
const fs = require('fs')


@Controller()
export class MasterdataController {
  constructor(private masterdataService: MasterdataService) {
  }



  @Get('masterdata/DataUsageCategory')
  async getDataUsageCategory(): Promise<DataUsageCategory[]> {
    return await this.masterdataService.getDataUsageCategory();
  }

  @Get('masterdata/ClimateImpact')
  async getAllClimateImpact(): Promise<ClimateImpact[]> {
    return await this.masterdataService.getAllClimateImpact();
  }

  @Get('masterdata/Deadline')
  async getAllDeadline(): Promise<Deadline[]> {
    return await this.masterdataService.getAllDeadline();
  }

  @Get('masterdata/Hierarchy')
  async getAllHierarchy(): Promise<Hierarchy[]> {
    return this.masterdataService.getAllHierarchy();
  }

  @Get('masterdata/Frequency')
  async getAllFrequncy(): Promise<Frequency[]> {
    return this.masterdataService.getAllFrequncy();
  }

  @Get('masterdata/DataRequsetStatus')
  async getAllDataRequsetStatus(): Promise<DataRequestStatus[]> {
    return await this.masterdataService.getAllDataRequsetStatus();
  }

  @Get('masterdata/DataRequsetStatus/:id')
  async getDataRequsetStatus(@Param('id') id: number): Promise<DataRequestStatus> {
    return await this.masterdataService.getDataRequsetStatus(id);
  }

  @Get('masterdata/getDataRequsetHistory/:parameterLocationDataId')
  async getDataRequsetHistory(@Param("parameterLocationDataId") parameterLocationDataId: number): Promise<DataRequestStatusHistory[]> {
    return await this.masterdataService.getDataRequsetHistory(parameterLocationDataId);
  }


  @Get('masterdata/SubSector/:sectorId')
  async getAllSubSectorbySector(@Param('sectorId') sectorId: number): Promise<SubSector[]> {
    return this.masterdataService.getAllSubSectorbySector(sectorId);
  }

  @Get('masterdata/FinancingScheme')
  async getAllFinancingScheme(): Promise<FinancingScheme[]> {
    return this.masterdataService.getAllFinancingScheme();
  }

  @Get('masterdata/SDBenefit')
  async getAllSDBenefit(): Promise<SDBenefit[]> {
    return this.masterdataService.getAllSDBenefit();
  }

  @Get('masterdata/Currency')
  async getAllCurrency(): Promise<Currency[]> {
    return this.masterdataService.getAllCurrency();
  }

  @Get('masterdata/Sector')
  async getAllSector(): Promise<Sector[]> {
    return this.masterdataService.getAllSector();
  }
  @Get('masterdata/Sector/:ccdataId')
  async getAllSectorByCCDataCatagary(@Param('ccdataId') ccdataId: number): Promise<Sector[]> {
    return this.masterdataService.getAllSectorByCCDataCatagary(ccdataId);
  }

  @Get('masterdata/ClimateChangeDataCategory')
  async getAllClimateChangeDataCategory(): Promise<ClimateChangeDataCategory[]> {
    return this.masterdataService.getAllClimateChangeDataCategory();
  }

  @Get('masterdata/institution-category')
  async getAllInstitutionCategory(): Promise<InstitutionCategory[]> {
    return this.masterdataService.getAllInstitutionCategory();
  }

  @Get('masterdata/institution-type')
  async getAllInstitutionType(): Promise<InstitutionType[]> {

    return this.masterdataService.getAllInstitutionType();

  }

  @Get('masterdata/province')
  getAllProvince(): Promise<Province[]> {
    return this.masterdataService.getAllProvince();
  }

  @Get('masterdata/projectType')
  getAllProjectType(): Promise<ProjectType[]> {
    return this.masterdataService.getAllProjectType();
  }

  @Get('masterdata/district')
  getAllDistricts(): Promise<District[]> {
    return this.masterdataService.getAllDistricts();
  }

  @Get('masterdata/district/:provinceId')
  getAllDistrictsByProvince(@Param('provinceId') provinceId: number): Promise<District[]> {

    return this.masterdataService.getAllDistrictsByProvince(provinceId);

  }

  @Get('masterdata/divisional-secretariat')
  getAllDivisionalSecretariat(): Promise<DivisionalSecretariat[]> {
    return this.masterdataService.getAllDivisionalSecretariat();
  }

  @Get('masterdata/divisional-secretariat/:districtId')
  getAllDivisionalSecretariatByDistrict(@Param('districtId') districtId: number): Promise<DivisionalSecretariat[]> {
    return this.masterdataService.getAllDivisionalSecretariatByDistrict(districtId);

  }

  @Get('masterdata/divisional-secretariat/province/:provinceId')
  async getAllDivisionalSecretariatByProvince(@Query('provinceId') provinceId: number): Promise<DivisionalSecretariat[]> {
    let districtIds = await this.masterdataService.getAllDistrictsByProvince(provinceId).then(res => {
      let ids: number[] = [];
      if (res) {
        ids = res.map(obj => obj.id);
      }
      return ids;
    })

    return this.masterdataService.getAllDivisionalSecretariatByDistricts(districtIds);
  }


  @Get('masterdata/parameter-data-type')
  getAllParameterDataTypes(): Promise<ParameterDataType[]> {
    return this.masterdataService.getAllParameterDataTypes();

  }
}

