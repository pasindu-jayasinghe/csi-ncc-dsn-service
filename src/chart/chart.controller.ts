import { ChartData } from './../shared/entities/climate-change-barchart.entity';
import { ChartService } from './chart.service';
import { Controller, Get } from '@nestjs/common';
import { ClimateChangeBarChart } from 'src/shared/entities/climate-change-barchart.entity';
import { AllowAnyRole } from 'nest-keycloak-connect';

@Controller('chart')
export class ChartController {

    /**
     *
     */
    constructor(private chartSerice: ChartService) {

    }

    @Get('chart/ClimateChangeChart')
    @AllowAnyRole()
    async getDatForClimateChangeChart(): Promise<ClimateChangeBarChart[]> {
        return await this.chartSerice.getDatForClimateChangeChart();
    }

    @Get('chart/UserDataUsage')
    @AllowAnyRole()
    async getDataforUserDataUsage(): Promise<ClimateChangeBarChart> {
        return await this.chartSerice.getDataforUserDataUsage();
    }


}
