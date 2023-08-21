import { Institution } from './../institution/institution.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterLocationData } from './entity/parameter-location-data.entity';
import { log } from 'console';
import { ParameterLocation } from './entity/parameter-location.entity';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Parameter } from './entity/parameter.entity';
import { IPaginationOptions, paginate, Pagination } from 'nestjs-typeorm-paginate';

@Injectable()
export class ParameterService extends TypeOrmCrudService<Parameter> {
    constructor(@InjectRepository(Parameter) repo) {
        super(repo);
      }

      async updateLocation(parameter : Parameter) : Promise<Parameter>{

        let paramterDB = await this.repo.findOne(parameter.id);

        paramterDB.dataCollectionLocation = parameter.dataCollectionLocation;
        paramterDB.dataCollectionGeography = parameter.dataCollectionGeography;

        let updateResult = this.repo.save(paramterDB);

        return updateResult;

      }

  async getNotRequestedParametera(options: IPaginationOptions, frequncyId: number, fromDate: Date, toDate: Date, insutationId: number): Promise<Pagination<Parameter>> {

    let filter: string;
    let fDate = `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}`;
    let tDate = `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}`;


    if (insutationId != 0) {
      filter = 'p.institutionId = :insutationId and p.frequencyId = :frequncyId '
    }
    else {
      filter = 'p.frequencyId = :frequncyId'
    }

    let data = this.repo.createQueryBuilder("p")
      .innerJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapMany('p.parameterLocation', ParameterLocation, 'pl', 'pl.parameterId = p.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .innerJoin('parameter_Location_data', 'pld', 'pld.parameterLocationId = pl.id and '
        + 'DATE(pld.startDate) != :fromDate and DATE(pld.endDate) != :toDate', { fromDate: fDate, toDate: tDate })
      .where(filter, { frequncyId: frequncyId, insutationId: insutationId });

    //console.log(data.getQueryAndParameters());
    let resualt = await paginate(data, options);
    return resualt;
  }

  async getRequestedParametera(options: IPaginationOptions, frequncyId: number, fromDate: Date, toDate: Date, insutationId: number): Promise<Pagination<Parameter>> {
    let filter: string;
    let fDate = `${fromDate.getFullYear()}-${fromDate.getMonth() + 1}-${fromDate.getDate()}`;
    let tDate = `${toDate.getFullYear()}-${toDate.getMonth() + 1}-${toDate.getDate()}`;

    if (insutationId != 0) {
      filter = 'p.institutionId = :insutationId and p.frequencyId = :frequncyId '
    }
    else {
      filter = 'p.frequencyId = :frequncyId'
    }
    let data = await this.repo.createQueryBuilder("p")
      .innerJoinAndMapOne('p.unitOfMeasure', UnitOfMeasure, 'um', 'um.id = p.unitOfMeasureId')
      .innerJoinAndMapMany('p.parameterLocation', ParameterLocation, 'pl', 'pl.parameterId = p.id')
      .innerJoinAndMapOne('pl.dataSource', Institution, 'in', 'in.id = pl.dataSourceId')
      .innerJoin('parameter_Location_data', 'pld', 'pld.parameterLocationId = pl.id and '
        + 'DATE(pld.startDate) = :fromDate and DATE(pld.endDate) = :toDate', { fromDate: fDate, toDate: tDate })
      .where(filter, { frequncyId: frequncyId, insutationId: insutationId });

    console.log(data.getQueryAndParameters());
    let resualt = await paginate(data, options);
    return resualt;
  }

  async softDelete(id: number){
    this.repo.softDelete({id});
    return;
  }
}