import { ClimateImpact } from './entity/climate-Impact.entity';
import { Deadline } from './entity/deadline.entity';
import { ParameterLocationData } from './../parameter/entity/parameter-location-data.entity';
import { Parameter } from './../parameter/entity/parameter.entity';
import { DataRequestStatusHistory } from './entity/datarequst-status-history.entity';
import { DataRequestStatus } from './entity/datarequst-status.entity';
import { Currency } from './entity/currency.entity';
import { SDBenefit } from './entity/sd-benefit.entity';
import { SubSector } from './../parameter/entity/sub.sector.entity';
import { Sector } from './../parameter/entity/sector.entity';
import { ClimateChangeDataCategory } from './../parameter/entity/climate.change.data.category.entity';
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { TypeOrmCrudService } from "@nestjsx/crud-typeorm";
import { promises } from "fs";
import { InstitutionType } from "src/institution/institution.type.entity";
import { ProjectType } from "src/project-program/entity/project-type.entity";
import { In, Repository } from "typeorm";
import { InstitutionCategory } from '../institution/institution.category.entity'
import { District } from "./entity/district.entity";
import { DivisionalSecretariat } from "./entity/divisional.secretariat.entity";
import { Province } from "./entity/provice.entity";
import { FinancingScheme } from './entity/financing-scheme.entity';
import { Frequency } from './entity/frequency.entity';
import { Hierarchy } from './entity/Hierarchy.entity';
import { ParameterDataType } from 'src/parameter/entity/parameter-data-type.entity';
import { DataUsageCategory } from 'src/users/data-usage-category.entity';

@Injectable()
export class MasterdataService {
    constructor(
        @InjectRepository(InstitutionCategory)
        private readonly institutionCategoryRepository: Repository<InstitutionCategory>,
        @InjectRepository(InstitutionType)
        private readonly institutionTypeRepository: Repository<InstitutionType>,
        @InjectRepository(Province)
        private readonly provinceRepository: Repository<Province>,
        @InjectRepository(District)
        private readonly districtRepository: Repository<District>,
        @InjectRepository(DivisionalSecretariat)
        private readonly divisionalSecretariatRepository: Repository<DivisionalSecretariat>,
        @InjectRepository(ProjectType)
        private readonly projectTypeRepository: Repository<ProjectType>,
        @InjectRepository(ClimateChangeDataCategory)
        private readonly ClimateChangeDataCategoryRepository: Repository<ClimateChangeDataCategory>,
        @InjectRepository(Sector)
        private readonly sectorRepository: Repository<Sector>,
        @InjectRepository(SubSector)
        private readonly subSectorRepository: Repository<SubSector>,
        @InjectRepository(SDBenefit)
        private readonly sdBenefitRepository: Repository<SDBenefit>,
        @InjectRepository(FinancingScheme)
        private readonly financingSchemeRepository: Repository<FinancingScheme>,
        @InjectRepository(Currency)
        private readonly currencySchemeRepository: Repository<Currency>,
        @InjectRepository(Frequency)
        private readonly frequencyRepository: Repository<Frequency>,
        @InjectRepository(DataRequestStatus)
        private readonly dataRequestStatusRepository: Repository<DataRequestStatus>,
        @InjectRepository(DataRequestStatusHistory)
        private readonly dataRequestStatusHistoryRepository: Repository<DataRequestStatusHistory>,
        @InjectRepository(Hierarchy)
        private readonly hierarchyRepository: Repository<Hierarchy>,
        @InjectRepository(Deadline)
        private readonly deadlineRepository: Repository<Deadline>,
        @InjectRepository(ClimateImpact)
        private readonly climateImpactRepository: Repository<ClimateImpact>,
        @InjectRepository(ParameterDataType)
        private readonly parameterDataTypeRepository: Repository<ParameterDataType>,
        @InjectRepository(DataUsageCategory)
        private readonly dataUsageCategoryRepository: Repository<DataUsageCategory>,


    ) {
        // ctor
    }

    async getDataUsageCategory(): Promise<DataUsageCategory[]> {
        return await this.dataUsageCategoryRepository.find({
            order: { name: 1 }
        })
    }


    async getAllClimateImpact(): Promise<ClimateImpact[]> {
        return await this.climateImpactRepository.find({
            order: { name: 1 }
        })
    }

    async getAllDeadline(): Promise<Deadline[]> {
        return await this.deadlineRepository.find({
            order: { name: 1 }
        })
    }

    async getAllHierarchy(): Promise<Hierarchy[]> {
        return await this.hierarchyRepository.find({
            order: { name: 1 }
        })
    }

    async getAllFrequncy(): Promise<Frequency[]> {
        return await this.frequencyRepository.find({
            order: { name: 1 },
            relations: ["deadline"]
        })
    }


    getAllCurrency(): Promise<Currency[]> {
        return this.currencySchemeRepository.find({
            order: { name: 1 }
        })

    }

    getAllFinancingScheme(): Promise<FinancingScheme[]> {
        return this.financingSchemeRepository.find({
            order: { name: 1 }
        })
    }

    getAllSDBenefit(): Promise<SDBenefit[]> {
        return this.sdBenefitRepository.find({
            order: { name: 1 }
        })
    }

    async getAllDataRequsetStatus(): Promise<DataRequestStatus[]> {
        return await this.dataRequestStatusRepository.find({
            order: { name: 1 }
        })
    }

    async getDataRequsetStatus(id: number): Promise<DataRequestStatus> {
        return await this.dataRequestStatusRepository.findOne({
            where: { id: id }, order: { name: 1 }
        })
    }

    async getDataRequsetHistory(parameterLocationDataId: number): Promise<DataRequestStatusHistory[]> {
        return await this.dataRequestStatusHistoryRepository.find({
            where: { parameterLocationData: parameterLocationDataId },
            relations: ["parameterLocationData", "parameterLocationData.parameterLocation", "parameterLocationData.parameterLocation.parameter"],
            order: { createdOn: -1 }
        })
    }



    getAllSubSectorbySector(sectorId: number): Promise<SubSector[]> {
        return this.subSectorRepository.find({
            where: { sector: { id: sectorId }, order: { name: 1 } }
        })
    }
    async getAllSector(): Promise<Sector[]> {
        return await this.sectorRepository.find({
            order: { name: 1 }
        })
    }

    async getAllSectorByCCDataCatagary(ccdataId: Number): Promise<Sector[]> {
        return await this.sectorRepository.find({
            where: { climateChangeDataCategory: { id: ccdataId } },
            order: { name: 1 }
        })
    }



    async getAllClimateChangeDataCategory(): Promise<ClimateChangeDataCategory[]> {
        return await this.ClimateChangeDataCategoryRepository.find({
            order: { name: 1 },
            relations: ['sectors']
        })
    }
    getAllProjectType(): Promise<ProjectType[]> {
        return this.projectTypeRepository.find({
            order: { name: 1 }
        });
    }
    getAllInstitutionCategory(): Promise<InstitutionCategory[]> {
        return this.institutionCategoryRepository.find({
            order: { name: 1 }
        });
    }
    getAllInstitutionType(): Promise<InstitutionType[]> {
        return this.institutionTypeRepository.find({
            order: { name: 1 }
        });
    }

    getAllProvince(): Promise<Province[]> {
        return this.provinceRepository.find({
            order: { name: 1 }
        });
    }

    getAllDistricts(): Promise<District[]> {
        return this.districtRepository.find({
            order: { name: 1 }
        });
    }

    getAllDistrictsByProvince(proviceId: number): Promise<District[]> {
        return this.districtRepository.find({ where: { province: { id: proviceId } }, order: { name: 1 } });
    }

    getAllDivisionalSecretariat(): Promise<DivisionalSecretariat[]> {
        return this.divisionalSecretariatRepository.find({
            order: { name: 1 }
        });
    }

    getAllDivisionalSecretariatByDistrict(districtId: number): Promise<DivisionalSecretariat[]> {
        return this.divisionalSecretariatRepository.find({
            where: { district: { id: districtId } },
            order: { name: 1 }
        });
    }

    getAllDivisionalSecretariatByDistricts(districtIdList: number[]): Promise<DivisionalSecretariat[]> {
        return this.divisionalSecretariatRepository.find({
            where: { district: { id: In(districtIdList) } },
            order: { name: 1 }
        });
    }

    getAllParameterDataTypes(): Promise<ParameterDataType[]> {
        return this.parameterDataTypeRepository.find({
            order: { name: 1 }
        });;

    }

}
