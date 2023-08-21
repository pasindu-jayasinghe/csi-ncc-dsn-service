import { ProjectStatus } from './../entity/project-status.entity';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';

@Injectable()
export class ProjectStatusService extends TypeOrmCrudService<ProjectStatus> {
    constructor(@InjectRepository(ProjectStatus) repo) {
        super(repo);
    }
}
