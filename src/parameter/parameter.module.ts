import { UomConversionService } from './../masterdata/uom-conversion/uom-conversion.service';
import { UomConversion } from 'src/masterdata/uom-conversion/entity/uom-conversion.entity';
import { User } from './../users/user.entity';
import { MasterdataService } from './../masterdata/masterdata.service';
import { DatarequestStatusHistoryModule } from './../datarequest-status-history/datarequest-status-history.module';
import { MasterdataModule } from './../masterdata/masterdata.module';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ClimateChangeDataCategoryController } from './climate-change-data-category.controller';
import { ClimateChangeDataCategoryService } from './climate-change-data-category.service';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { ParameterLocationData } from './entity/parameter-location-data.entity';
import { ParameterLocation } from './entity/parameter-location.entity';
import { Parameter } from './entity/parameter.entity';
import { Sector } from './entity/sector.entity';
import { SectorMOE } from './entity/sector.moe.entity';
import { SubSector } from './entity/sub.sector.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterLocationDataController } from './parameter-location-data.controlller';
import { ParameterLocationDataService } from './parameter-location-data.service';
import { ParameterLocationController } from './parameter-location.controller';
import { ParameterLocationService } from './parameter-location.service';
import { ParameterController } from './parameter.controller';
import { ParameterService } from './parameter.service';
import { SectorMOEService } from './sector-moe-service';
import { SectorMOEController } from './sector-moe.controller';
import { SectorController } from './sector.controller';
import { SectorService } from './sector.service';
import { SubSectorController } from './sub-sector.controller';
import { SubSectorService } from './sub-sector.service';
import { UnitOfMeasureController } from './unitofmeasure.controller';
import { UnitOfMeasureService } from './unitofmeasure.service';
import { FinanceModule } from 'src/finance/finance.module';
import { Userv2Module } from 'src/userv2/userv2.module';
import { EmailNitificationService } from 'src/notifications/email.notification.service';
import { UsersService } from 'src/users/users.service';
import { InstitutionCategory } from 'src/institution/institution.category.entity';
import { Institution } from 'src/institution/institution.entity';
import { UserTypeService } from 'src/masterdata/user-type/user.type.service';
import { UserType } from 'src/users/user.type.entity';
import { KeyClockService } from 'src/auth/keycloak-nodejs-admin-client/keyclock.service';


@Module({
  imports: [TypeOrmModule.forFeature([Parameter, UnitOfMeasure, ClimateChangeDataCategory,
    Sector, SubSector, SectorMOE, ParameterLocation, ParameterLocationData, User, Institution, UserType, UomConversion]), MasterdataModule, DatarequestStatusHistoryModule, FinanceModule, Userv2Module],
  controllers: [ParameterController, UnitOfMeasureController, ClimateChangeDataCategoryController,
    SectorController, SubSectorController, SectorMOEController, ParameterLocationController, ParameterLocationDataController],
  providers: [ParameterService, UnitOfMeasureService, ClimateChangeDataCategoryService, SectorService, UomConversionService,
    SubSectorService, SectorMOEService, ParameterLocationService, ParameterLocationDataService, EmailNitificationService, UsersService, KeyClockService]
})
export class ParameterModule { }
