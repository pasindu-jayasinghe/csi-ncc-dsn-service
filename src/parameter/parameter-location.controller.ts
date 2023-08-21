import { FrequencyDetail } from './../masterdata/entity/frequency-details.entity';
import { Frequency } from './../masterdata/entity/frequency.entity';
//parameter-location.service
import { Body, Controller, Param, Post, Query } from '@nestjs/common';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse } from '@nestjsx/crud';
import { ClimateChangeDataCategoryService } from './climate-change-data-category.service';
import { ParameterLocationUpdateRequestDto } from './dto/location.update.request.paramter.dto';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { ParameterLocation } from './entity/parameter-location.entity';
import { Parameter } from './entity/parameter.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterLocationService } from './parameter-location.service';
import { ParameterService } from './parameter.service';
import { UnitOfMeasureService } from './unitofmeasure.service';
import { Unprotected } from 'nest-keycloak-connect';


@Crud({
  model: {
    type: ParameterLocation,
  },
  query: {
    join: {
      parameter: {
        eager: true,

      },
      'parameter.sector': {
        eager: true,

      },
      'parameter.climateChangeDataCategory': {
        eager: true,

      },
      'parameter.frequency': {
        eager: true,

      },
      province: {
        eager: true,

      },
      district: {
        eager: true,

      },
      divisionalSecretariat: {
        eager: true,

      },
      dataSource: {
        eager: true,

      },
      frequency: {
        eager: true
      },
      frequencyDetail: {
        eager: true
      },


    }
  }




})

@Controller('parameter-location')
export class ParameterLocationController implements CrudController<ParameterLocation> {

  constructor(public service: ParameterLocationService) {

  }

  @Post('update-location')
  async updateLocations(@Body() parameterLocationUpdateRequestDto: ParameterLocationUpdateRequestDto): Promise<ParameterLocation[]> {

    let paramterLocationsNew: ParameterLocation[] = [];

    parameterLocationUpdateRequestDto.parameterLocations.forEach((pl, index) => {

      let plNew: ParameterLocation = new ParameterLocation();

      plNew = { ...plNew, ...pl };

      if (plNew.dataSource && !plNew.dataSource.id) {
        plNew.dataSource = undefined;
      }
      if (!plNew.isNational) {
        plNew.isNational = false;
      }
      if (!plNew.isSpecificLocation) {
        plNew.isSpecificLocation = false;
      }

      paramterLocationsNew.push(plNew);
      console.log("777777 index :", index)

    }
    );
    console.log("777777 paramterLocationsNew========================", paramterLocationsNew.length);
    this.service.updateLocation(parameterLocationUpdateRequestDto.parameterId, paramterLocationsNew);

    if(parameterLocationUpdateRequestDto.locationName){
      this.service.updateLocationName(parameterLocationUpdateRequestDto.parameterId, parameterLocationUpdateRequestDto.locationName);
    }

    return null;
  }

  
  @Post('update-location-bulk/:paramterId/:dataSourceId')
  @Unprotected()
  async updateLocationsBulk(@Query('paramterId') paramterId : number,@Query('dataSourceId')  dataSourceId : number): Promise<ParameterLocation[]> {

    await this.service.updateLocationsBulk(paramterId, dataSourceId);
    return [];

  }

  @Post('update-location-source')
  async updateLocationsSource(@Body() parameterLocationUpdateRequestDto: ParameterLocationUpdateRequestDto): Promise<ParameterLocation[]> {

    let paramterLocationsNew: ParameterLocation[] = [];

    parameterLocationUpdateRequestDto.parameterLocations.forEach(pl => {

      let plNew: ParameterLocation = new ParameterLocation();

      plNew = { ...plNew, ...pl };

      if (plNew.dataSource && !plNew.dataSource.id) {
        plNew.dataSource = undefined;
      }
     

      paramterLocationsNew.push(plNew);

    }
    );
    // console.log("paramterLocationsNew========================", paramterLocationsNew);
    this.service.updateLocationSource(paramterLocationsNew);
    return null;
  }


  @Post('delete-location')
  async deleteLocation(@Body() paramterLocation: ParameterLocation): Promise<boolean> {


    return this.service.removeLocation(paramterLocation);

  }



}




