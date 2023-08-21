import { DocumentService } from './../../document/document.service';
import { DocumentModule } from './../../document/document.module';
import { PolicyData } from './../../policy/entity/policy-data.entity';
import { ProjectProgramme } from 'src/project-program/entity/project-programme.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { PublicController } from './public.controller';
import { PublicService } from './public.service';
import { Documents } from 'src/document/entity/document.entity';
import { ProjectProgramData } from 'src/project-program/entity/project-program-data.entity';
import { Policy } from 'src/policy/entity/policy.entity';

@Module({
    imports: [TypeOrmModule.forFeature([Documents, ProjectProgramme, ProjectProgramData, PolicyData, Policy]), DocumentModule],
    controllers: [PublicController],
    providers: [PublicService, DocumentService],
    exports: [PublicService, DocumentService]
})
export class PublicModule { }
