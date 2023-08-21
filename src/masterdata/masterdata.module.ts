import { ClimateImpact } from './entity/climate-Impact.entity';
import { Deadline } from './entity/deadline.entity';
import { Hierarchy } from './entity/Hierarchy.entity';
import { DataRequestStatusHistory } from './entity/datarequst-status-history.entity';
import { DataRequestStatus } from './entity/datarequst-status.entity';
import { SDBenefit } from './entity/sd-benefit.entity';
import { SubSector } from './../parameter/entity/sub.sector.entity';
import { Sector } from './../parameter/entity/sector.entity';
import { ClimateChangeDataCategory } from './../parameter/entity/climate.change.data.category.entity';
import { ProjectType } from './../project-program/entity/project-type.entity';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserType } from 'src/users/user.type.entity';
import { UserTypeController } from './user-type/user.type.controller';
import { UserTypeService } from './user-type/user.type.service';
import { MasterdataService } from './masterdata.service';
import { MasterdataController } from './masterdata.controller';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { InstitutionCategory } from 'src/institution/institution.category.entity';
import { Province } from './entity/provice.entity';
import { District } from './entity/district.entity';
import { DivisionalSecretariat } from './entity/divisional.secretariat.entity';
import { InstitutionType } from 'src/institution/institution.type.entity';
import { Currency } from './entity/currency.entity';
import { FinancingScheme } from './entity/financing-scheme.entity';
import { Frequency } from './entity/frequency.entity';
import { FrequencyDetail } from './entity/frequency-details.entity';
import { MitigationModule } from './mitigation/mitigation.module';
import { User } from 'src/users/user.entity';
import { UomConversionModule } from './uom-conversion/uom-conversion.module';
import { CcImpactModule } from './cc-impact/cc-impact.module';
import { ParameterDataType } from 'src/parameter/entity/parameter-data-type.entity';
import { DataUsageCategory } from 'src/users/data-usage-category.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, UserType, InstitutionCategory, InstitutionType, Province, District, DivisionalSecretariat, ProjectType,
    ClimateChangeDataCategory, Sector, SubSector, Currency, FinancingScheme, SDBenefit, Frequency, FrequencyDetail,
    DataRequestStatus, DataRequestStatusHistory, Hierarchy, Deadline, ClimateImpact, ParameterDataType, DataUsageCategory]), MitigationModule, UomConversionModule, CcImpactModule],
  providers: [UserTypeService, MasterdataService],
  controllers: [UserTypeController, MasterdataController],
  exports: [UserTypeService, MasterdataService],
})
export class MasterdataModule { }
