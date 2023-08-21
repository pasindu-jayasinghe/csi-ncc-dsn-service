import { ProjectStatusService } from './project-status.service';
import { ProjectStatusController } from './project-status.controller';
import { ProjectStatus } from './../entity/project-status.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';

@Module({
    imports: [TypeOrmModule.forFeature([ProjectStatus])],
    controllers: [ProjectStatusController],
    providers: [ProjectStatusService]
})
export class ProjectStatusModule { }
