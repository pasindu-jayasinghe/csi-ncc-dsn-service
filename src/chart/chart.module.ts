import { DataUsageCategory } from './../users/data-usage-category.entity';
import { ShoppingCart } from './../finance/entity/shopping-cart.entity';
import { Sector } from './../parameter/entity/sector.entity';
import { ClimateChangeDataCategory } from './../parameter/entity/climate.change.data.category.entity';
import { Parameter } from './../parameter/entity/parameter.entity';
import { ProjectProgramme } from './../project-program/entity/project-programme.entity';
import { ChartService } from './chart.service';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ChartController } from './chart.controller';
import { MasterdataModule } from 'src/masterdata/masterdata.module';

@Module({
    imports: [TypeOrmModule.forFeature([ProjectProgramme, Parameter, ClimateChangeDataCategory, Sector,
        ShoppingCart, DataUsageCategory]), MasterdataModule],
    controllers: [ChartController],
    providers: [ChartService],
    exports: [ChartService]
})
export class ChartModule { }
