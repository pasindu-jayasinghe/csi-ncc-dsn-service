//ClimateChangeDataCategory
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';

@Injectable()
export class ClimateChangeDataCategoryService extends TypeOrmCrudService<ClimateChangeDataCategory> {
    constructor(@InjectRepository(ClimateChangeDataCategory) repo) {
        super(repo);
      }
}