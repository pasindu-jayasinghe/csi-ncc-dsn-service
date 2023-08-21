import { InjectRepository } from '@nestjs/typeorm';
import { ClimateImpact } from './../entity/climate-Impact.entity';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Injectable } from '@nestjs/common';

@Injectable()
export class CcImpactService extends TypeOrmCrudService<ClimateImpact> {
    constructor(@InjectRepository(ClimateImpact) repo) {
        super(repo);
    }
}
