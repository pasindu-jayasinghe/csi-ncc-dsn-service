import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ProjectFundingDetail } from '../entity/project-funding-detail.entity';

@Injectable()
export class ProjectFundingDetailService extends TypeOrmCrudService<ProjectFundingDetail> {
    constructor(@InjectRepository(ProjectFundingDetail) repo) {
        super(repo);
    }
}