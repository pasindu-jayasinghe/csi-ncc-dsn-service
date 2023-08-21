import { PolicyData } from './../policy/entity/policy-data.entity';
import { Policy } from './../policy/entity/policy.entity';
import { User } from './../users/user.entity';
import { ParameterLocationData } from './../parameter/entity/parameter-location-data.entity';
import { ParameterLocationDataService } from './../parameter/parameter-location-data.service';
import { Module, Param } from '@nestjs/common';
import { InstitutionService } from './institution.service';
import { InstitutionController } from './institution.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Institution } from './institution.entity';
import { Repository } from "typeorm";
import { ProjectProgramData } from 'src/project-program/entity/project-program-data.entity';


@Module({
  imports: [TypeOrmModule.forFeature([Institution, ParameterLocationData, ProjectProgramData, User, PolicyData])],
  providers: [InstitutionService],
  controllers: [InstitutionController],
  exports: [InstitutionService],
})
export class InstitutionModule { }
