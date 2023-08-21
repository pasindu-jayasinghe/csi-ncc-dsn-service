import { DataUsageCategory } from './../users/data-usage-category.entity';
import { ShoppingCart } from './../finance/entity/shopping-cart.entity';
import { Parameter } from './../parameter/entity/parameter.entity';
import { count } from 'console';
import { ProjectProgramme } from './../project-program/entity/project-programme.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from "typeorm";
import { ChartData, ProjectsBorderColor, ProjectsColor, ProgramColor, ProgramBorderColor, ParameterColor, ParameterBorderColor, Policycolor, PolicyBordercolor, ChartDataSimple, usercolor, userBordercolor } from './../shared/entities/climate-change-barchart.entity';
import { Sector } from './../parameter/entity/sector.entity';
import { Injectable } from '@nestjs/common';
import { MasterdataService } from 'src/masterdata/masterdata.service';
import { ClimateChangeBarChart } from 'src/shared/entities/climate-change-barchart.entity';

@Injectable()
export class ChartService {
    /**
     *
     */
    constructor(private masterDataService: MasterdataService,
        @InjectRepository(ProjectProgramme)
        private readonly projectProgrammeRepository: Repository<ProjectProgramme>,
        @InjectRepository(Parameter)
        private readonly parameterRepository: Repository<Parameter>,
        @InjectRepository(ShoppingCart)
        private readonly shoppingCartRepository: Repository<ShoppingCart>,
        @InjectRepository(DataUsageCategory)
        private readonly dataUsageCategoryRepository: Repository<DataUsageCategory>,
    ) {

    }

    async getDatForClimateChangeChart(): Promise<ClimateChangeBarChart[]> {
        let climateChangeBarChart: ClimateChangeBarChart[] = new Array();
        let labels: string[] = new Array();

        let sectors = await this.masterDataService.getAllSector();

        for (const s of sectors) {
            labels.push(s.name)
        }

        let climateChangeData = await this.masterDataService.getAllClimateChangeDataCategory();

        for (const c of climateChangeData) {
            let brchat: ClimateChangeBarChart = new ClimateChangeBarChart();
            brchat.datasets = new Array();
            brchat.labels = labels;
            brchat.title = c.name;

            let paramectorDetails = await this.parameterRepository.createQueryBuilder("p")
                .select("COUNT(*)", "count")
                .addSelect("p.sectorId", "sectorId")
                .where("p.climateChangeDataCategoryId = :climateChangeDataCategoryId", { climateChangeDataCategoryId: c.id })
                .groupBy("p.sectorId").getRawMany();

            let datasetparam: ChartData = new ChartData();
            datasetparam.label = "Parameters";
            datasetparam.data = new Array();
            datasetparam.backgroundColor = ParameterColor;
            datasetparam.borderColor = ParameterBorderColor;
            for (const s of sectors) {
                let item = paramectorDetails.find(a => a.sectorId == s.id);
                let count: number = 0;

                if (item) {
                    count = item.count;
                }
                datasetparam.data.push(count);
            }
            brchat.datasets.push(datasetparam);

            let ppsectorDetails = await this.projectProgrammeRepository.createQueryBuilder("pp")
                .select("COUNT(*)", "count")
                .addSelect("pp.sectorId", "sectorId")
                .where("pp.climateChangeDataCategoryId = :climateChangeDataCategoryId and pp.isProject = 1", { climateChangeDataCategoryId: c.id })
                .groupBy("pp.sectorId").getRawMany();


            let datasetProj: ChartData = new ChartData();
            datasetProj.label = "Projects";
            datasetProj.data = new Array();
            datasetProj.backgroundColor = ProjectsColor;
            datasetProj.borderColor = ProjectsBorderColor;
            for (const s of sectors) {
                let item = ppsectorDetails.find(a => a.sectorId == s.id);
                let count: number = 0;

                if (item) {
                    count = item.count;
                }
                datasetProj.data.push(count);
            }
            brchat.datasets.push(datasetProj);

            let programsectorDetails = await this.projectProgrammeRepository.createQueryBuilder("pp")
                .select("COUNT(*)", "count")
                .addSelect("pp.sectorId", "sectorId")
                .where("pp.climateChangeDataCategoryId = :climateChangeDataCategoryId and pp.isProject = 0", { climateChangeDataCategoryId: c.id })
                .groupBy("pp.sectorId").getRawMany();

            let datasetProg: ChartData = new ChartData();
            datasetProg.label = "Programmes";
            datasetProg.data = new Array();
            datasetProg.backgroundColor = ProgramColor;
            datasetProg.borderColor = ProgramBorderColor;
            for (const s of sectors) {
                let item = programsectorDetails.find(a => a.sectorId == s.id);
                let count: number = 0;

                if (item) {
                    count = item.count;
                }
                datasetProg.data.push(count);
            }
            brchat.datasets.push(datasetProg);



            let datasetPolice: ChartData = new ChartData();
            datasetPolice.label = "Policies and regulations";
            datasetPolice.data = new Array();
            datasetPolice.backgroundColor = Policycolor;
            datasetPolice.borderColor = PolicyBordercolor;
            for (const s of sectors) {
                datasetPolice.data.push(0);
            }
            brchat.datasets.push(datasetPolice);


            climateChangeBarChart.push(brchat);
        }

        return climateChangeBarChart;

    }

    async getDataforUserDataUsage(): Promise<ClimateChangeBarChart> {
        let chartDataSimple: ChartData[] = new Array();

        // let dataUsageDetail = await this.shoppingCartRepository.createQueryBuilder("sc")
        //     .select('count(duc.name)', 'count')
        //     .addSelect('duc.name', 'catagryname')
        //     .innerJoin('user_data_usage_category', 'usc', 'usc.email = sc.userEmail')
        //     .innerJoin('data_usage_category', 'duc', 'duc.id = usc.dataUsageCategoryId')
        //     .groupBy('duc.name')
        //     .getRawMany();

        // let dataUsageDetail = await this.dataUsageCategoryRepository.createQueryBuilder("duc")
        //     .select('count(sc.id)', 'count')
        //     .addSelect('duc.name', 'catagryname')
        //     .leftJoin('user_data_usage_category', 'usc', 'duc.id = usc.dataUsageCategoryId')
        //     .leftJoin('shopping_cart', 'sc', 'usc.email = sc.userEmail')
        //     .groupBy('duc.name')
        //     .orderBy('duc.name')
        //     .getRawMany();

            let dataUsageDetail = await this.dataUsageCategoryRepository.createQueryBuilder("duc")
            .select('count(usc.id)', 'count')
            .addSelect('duc.name', 'catagryname')
            .leftJoin('user_data_usage_category', 'usc', 'duc.id = usc.dataUsageCategoryId')
            //.leftJoin('shopping_cart', 'sc', 'usc.email = sc.userEmail')
            .groupBy('duc.name')
            .orderBy('duc.name')
            .getRawMany();

        let total = dataUsageDetail.map(item => item.count).reduce((prev, next) => parseInt(prev) + parseInt(next));

        let names = dataUsageDetail.map(a => a.catagryname);

        let brchat: ClimateChangeBarChart = new ClimateChangeBarChart();
        brchat.datasets = new Array();
        brchat.labels = names;
        let chartDetail = new ChartData();
        chartDetail.label = "Percentage (%)";
        chartDetail.backgroundColor = usercolor;
        chartDetail.borderColor = userBordercolor;
        chartDetail.data = new Array();

        for (const c of dataUsageDetail) {
            chartDetail.data.push(c.count != 0 ? (c.count * 100) / total : 0);
        }
        chartDataSimple.push(chartDetail);

        brchat.datasets = chartDataSimple;


        return brchat;


    }
}
