//SectorMOE
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { SectorMOE } from './entity/sector.moe.entity';

@Injectable()
export class SectorMOEService extends TypeOrmCrudService<SectorMOE> {
    constructor(@InjectRepository(SectorMOE) repo) {
        super(repo);
      }
}

