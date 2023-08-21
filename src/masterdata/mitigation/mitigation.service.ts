import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Injectable } from '@nestjs/common';
import { Mitigation } from './entity/mitigation.entity';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class MitigationService extends TypeOrmCrudService<Mitigation> {
    constructor(@InjectRepository(Mitigation) repo) {
        super(repo);
    }
}
