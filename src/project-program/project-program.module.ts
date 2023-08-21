import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/users/user.entity';
import { ProjectFundingDetail } from './entity/project-funding-detail.entity';
import { ProjectProgramme } from './entity/project-programme.entity';
import { ProjectFundingDetailController } from './project-funding-detail/project-funding-detail.controller';
import { ProjectFundingDetailService } from './project-funding-detail/project-funding-detail.service';
import { ProjectProgramController } from './project-program.controller';
import { ProjectProgramService } from './project-program.service';
import { ProjectStatusModule } from './project-status/project-status.module';

@Module({
  imports: [TypeOrmModule.forFeature([ProjectProgramme, ProjectFundingDetail,User])],
  controllers: [ProjectProgramController, ProjectFundingDetailController],
  providers: [ProjectProgramService, ProjectFundingDetailService],
  exports: [ProjectProgramService, ProjectFundingDetailService]
})
export class ProjectProgramModule { }
