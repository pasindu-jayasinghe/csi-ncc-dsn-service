import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { Sector } from './entity/sector.entity';

@Injectable()
export class SectorService extends TypeOrmCrudService<Sector> {
    constructor(@InjectRepository(Sector) repo) {
        super(repo);
      }
}
