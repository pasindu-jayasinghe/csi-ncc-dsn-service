import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { SubSector } from './entity/sub.sector.entity';

@Injectable()
export class SubSectorService extends TypeOrmCrudService<SubSector> {
    constructor(@InjectRepository(SubSector) repo) {
        super(repo);
      }
}
