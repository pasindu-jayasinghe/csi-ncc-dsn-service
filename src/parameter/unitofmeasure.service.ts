import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';

@Injectable()
export class UnitOfMeasureService extends TypeOrmCrudService<UnitOfMeasure> {
    constructor(@InjectRepository(UnitOfMeasure) repo) {
        super(repo);
      }
}