import { DivisionalSecretariat } from 'src/masterdata/entity/divisional.secretariat.entity';
import { District } from 'src/masterdata/entity/district.entity';
import { Province } from 'src/masterdata/entity/provice.entity';
import { ParameterLocationData } from './entity/parameter-location-data.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { Parameter } from './entity/parameter.entity';
import { Institution } from './../institution/institution.entity';
//ParameterLocation
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { IPaginationOptions, paginate, Pagination } from 'nestjs-typeorm-paginate';
import { ParameterLocation } from './entity/parameter-location.entity';

@Injectable()
export class ParameterLocationService extends TypeOrmCrudService<ParameterLocation> {
  constructor(@InjectRepository(ParameterLocation) repo) {
    super(repo);
  }

  public async deleteByParameterId(pId: number) {

    let location = await this.repo.find({ where: { parameter: { id: pId } } })

    for (let index = 0; index < location.length; index++) {
      const parameterLocation = location[index];
      this.repo.softDelete(parameterLocation.id);

    }



  }


  async updateLocationName(paramterId: number, locationName: string): Promise<boolean> {

    await this.repo.createQueryBuilder()
      .update(Parameter)
      .set({
        locationName: locationName
      })
      .where("id = :id", { id: paramterId })
      .execute();

    return true;

    return true;
  }

  /*    
    given ParameterLocation[] will be iterate one by one and add new / rempve not in ones 
  */
  async updateLocation(paramterId: number, paramterLocations: ParameterLocation[]): Promise<boolean> {


    let locationsInDb = await this.repo.find({ where: { parameter: { id: paramterId } }, relations: ["province", "district", "divisionalSecretariat"] });

    for await (const locationInDB of locationsInDb) {

      let locTemp = paramterLocations.find(loc => loc.id == locationInDB.id);

      if (locTemp) {
        // location in the db with same id
        console.log("location in the db with same id");
        this.repo.save(locTemp);// data source updates will be saved
      } else {
        console.log("location in the db with same id NOT found");
        //console.log("locationInDB", locationInDB);

        // check for add and remove the same ( so need to compare the data)
        let locTemp2 = paramterLocations.find(loc => loc.isNational == locationInDB.isNational && loc.isSpecificLocation == locationInDB.isSpecificLocation &&
          (loc.province?.id == locationInDB.province?.id && loc.district?.id == locationInDB.district?.id && loc.divisionalSecretariat?.id == locationInDB.divisionalSecretariat?.id));

        if (locTemp2) {
          //location is in db, nothing to do ( user had , remove and added)
          console.log("location is in db, nothing to do");
        } else {
          // the location is not in the list comming from clint side, its removed, so remove it
          console.log("the location is not in the list comming from clint side, its removed, so remove it");

          this.repo.softDelete(locationInDB.id).then();// remove the record
        }

      }




    }

    let locationsInDbUpdated = await this.repo.find({ where: { parameter: { id: paramterId } }, relations: ["province", "district", "divisionalSecretariat"] });

    console.log("try to add new if any");
    // add new
    for await (const locationInRequest of paramterLocations) {
      if (!locationInRequest.id) {


        let locTemp = locationsInDbUpdated.find(loc => loc.isNational == locationInRequest.isNational && loc.isSpecificLocation == locationInRequest.isSpecificLocation &&
          ((locationInRequest.province && loc.province?.id == locationInRequest.province?.id)
            || (locationInRequest.district && loc.district?.id == locationInRequest.district?.id)
            || (locationInRequest.divisionalSecretariat && loc.divisionalSecretariat?.id == locationInRequest.divisionalSecretariat?.id)));

        if (locTemp) {
          //location is in db, nothing to do
          console.log("Trye add new, location is in db, nothing to do", locTemp.id);
        } else {
          // the location is not in the db, add 
          console.log("Trye add new, the location is not in the db, add it", locationInRequest.id);

          this.repo.save(locationInRequest)// remove the record
        }
      }


    }

    // update data source if chnages

    // remove 

    //console.log(paramterLocations);
    // add new, update old

    // this.repo.save(paramterLocations).then(res => {
    //   return res;
    // }, reject => {
    //   console.log(reject);
    // });



    return true;
  }

  async updateLocationsBulk(paramterId: number, dataSourceId: number): Promise<boolean> {


    await this.repo.createQueryBuilder()
      .update(ParameterLocation)
      .set({
        dataSource: { id: dataSourceId }
      })
      .where("parameterId = :id", { id: paramterId })
      .execute();

    return true;

  }

  async updateLocationSource(paramterLocations: ParameterLocation[]): Promise<boolean> {

    if (paramterLocations.length > 0) {


      for (let index = 0; index < paramterLocations.length; index++) {

        const element = paramterLocations[index];

        await this.repo.createQueryBuilder()
          .update(ParameterLocation)
          .set({
            dataSource: element.dataSource
          })
          .where("id = :id", { id: element.id })
          .execute();

      }

    }

    return true;
  }

  /*    
    given ParameterLocation[] will be iterate one by one and add new / rempve not in ones 
  */
  async removeLocation(paramterLocations: ParameterLocation): Promise<boolean> {

    if (paramterLocations.id > 0) {
      this.repo.remove(paramterLocations);
    }

    return true;

  }

  async getNotRequestedParametera(options: IPaginationOptions, frequncyId: number, fromDate: Date, toDate: Date, insutationId: number, paramName: string): Promise<Pagination<ParameterLocation>> {

    let filter: string = 'p.frequencyId = :frequncyId and pld.startDate is null and pld.endDate  is null';
    let fDate = `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}`;
    let tDate = `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}`;


    if (insutationId != 0) {
      filter = filter + ' and pl.dataSourceId = :insutationId and p.frequencyId = :frequncyId'
    }

    if (paramName != null && paramName != undefined && paramName != "") {
      filter = filter + ' and  p.name LIKE :paramName'
    }

    let data = this.repo.createQueryBuilder("pl")
      .innerJoinAndMapOne('pl.parameter', Parameter, 'p', 'pl.parameterId = p.id')
      .leftJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .leftJoinAndMapOne('pl.province', Province, 'pr', 'pl.provinceId = pr.id')
      .leftJoinAndMapOne('pl.district', District, 'd', 'pl.districtId = d.id')
      .leftJoinAndMapOne('pl.divisionalSecretariat', DivisionalSecretariat, 'ds', 'pl.divisionalSecretariatId = ds.id')
      .leftJoinAndMapMany('pl.ParameterLocationData', ParameterLocationData, 'pld', 'pld.parameterLocationId = pl.id and '
        + 'DATE(pld.startDate) = :fromDate and DATE(pld.endDate) = :toDate and pld.frequencyId = :frequncyId', { fromDate: fDate, toDate: tDate, frequncyId: frequncyId })
      .where(filter, { frequncyId: frequncyId, insutationId: insutationId, paramName: `%${paramName}%` });

    //console.log(data.getQueryAndParameters());
    let resualt = await paginate(data, options);
    return resualt;
  }


}
