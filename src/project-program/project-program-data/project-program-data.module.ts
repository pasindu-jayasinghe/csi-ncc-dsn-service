import { User } from './../../users/user.entity';
import { ProjectProgramDataService } from './project-program-data.service';
import { ProjectProgramDataController } from './project-program-data.controller';
import { ProjectProgramData } from './../entity/project-program-data.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { ProjectProgramModule } from '../project-program.module';
import { MasterdataModule } from 'src/masterdata/masterdata.module';
import { DatarequestStatusHistoryModule } from 'src/datarequest-status-history/datarequest-status-history.module';

@Module({
    imports: [TypeOrmModule.forFeature([ProjectProgramData, User]), ProjectProgramModule, MasterdataModule, DatarequestStatusHistoryModule],
    controllers: [ProjectProgramDataController],
    providers: [ProjectProgramDataService]
})
export class ProjectProgramDataModule { }