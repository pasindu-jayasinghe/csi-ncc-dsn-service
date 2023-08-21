import { ClimateImpact } from './../../masterdata/entity/climate-Impact.entity';
import { Deadline } from './../../masterdata/entity/deadline.entity';
import { Institution } from 'src/institution/institution.entity';
import { ParameterLocation } from './parameter-location.entity';
import { type } from "os";
import { Policy } from "src/policy/entity/policy.entity";
import { ProjectProgramme } from "src/project-program/entity/project-programme.entity";
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { UnitOfMeasure } from "src/parameter/entity/unitofmeasure.entity";
import { Column, DeleteDateColumn, Entity, JoinColumn, JoinTable, ManyToMany, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { ClimateChangeDataCategory } from "./climate.change.data.category.entity";
import { DataCollectionGeography } from "./data-collection-geography.entity";
import { DataCollectionLocation } from "./data-collection-location.entity";
import { Sector } from "./sector.entity";
import { SectorMOE } from "./sector.moe.entity";
import { SubSector } from "./sub.sector.entity";
import { flatten } from "@nestjs/common";
import { Frequency } from 'src/masterdata/entity/frequency.entity';
import { ParameterDataType } from './parameter-data-type.entity';

@Entity()
export class Parameter extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();
        this.description = "";
        this.isPolicy = false;
        this.isOther = false;
        this.isProgramme = false;
        this.isProject = false;
        this.dataCollectionGeography = 1;
        this.dataCollectionLocation = 1;
        this.isPublicData = false;
        this.sampleParamterReading = "";
        this.commercialValue = 0;
        this.sampleParamterReading = "";
        this.minSampleValue = "";
        this.maxSampleValue = "";
        this.locationName = "";

    }

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({ length: 2500 })
    description: string;

    @ManyToOne(type => ParameterDataType)
    @JoinColumn()
    parameterDataType: ParameterDataType

    // uom of the data value  of the parameter data reading
    @ManyToOne(type => UnitOfMeasure, { nullable: true })
    @JoinColumn()
    unitOfMeasure?: UnitOfMeasure;

    // // these are the uoms data entry user can select while data entry
    // @ManyToMany(() => UnitOfMeasure)
    // @JoinTable()
    // unitOfMeasuresFordataEntry?: UnitOfMeasure[];

    // sample of paramter dta reading : 200 Kg
    @Column()
    sampleParamterReading: string;

    @Column({ nullable: true })
    minSampleValue: string;

    @Column({ nullable: true })
    maxSampleValue: string;

    @ManyToOne(type => Frequency)
    @JoinColumn()
    frequency: Frequency;

    @ManyToOne(type => Deadline)
    @JoinColumn()
    deadline?: Deadline;

    @ManyToOne(type => ClimateImpact)
    @JoinColumn()
    climateImpact?: ClimateImpact;



    @ManyToOne(type => ClimateChangeDataCategory)
    @JoinColumn()
    climateChangeDataCategory: ClimateChangeDataCategory;

    @ManyToOne(type => Sector)
    @JoinColumn()
    sector?: Sector;

    // @ManyToOne(type => SubSector, { nullable: true })
    // @JoinColumn()
    // subSector? : SubSector;

    @ManyToOne(type => Institution)
    @JoinColumn()
    institution?: Institution;

    @OneToMany(type => ParameterLocation, pl => pl.parameter)
    @JoinTable()
    parameterLocation?: ParameterLocation[];

    @ManyToOne(type => SubSector)
    @JoinColumn()
    subSector?: SubSector;

    // @ManyToOne(type => SectorMOE)
    // @JoinColumn()
    // sectorMoE: SectorMOE;

    @Column()
    isProject: boolean;

    @ManyToOne(type => ProjectProgramme)
    @JoinColumn()
    project?: ProjectProgramme;

    @Column()
    isProgramme: boolean;

    @ManyToOne(type => ProjectProgramme)
    @JoinColumn()
    programme?: ProjectProgramme;

    @Column()
    isPolicy: boolean;

    @ManyToOne(type => Policy)
    @JoinColumn()
    policy?: Policy;

    @Column()
    isOther: boolean;

    @Column({ nullable: true })
    isPublicData?: boolean;

    @Column()
    commercialValue: number;

    @Column()
    dataCollectionLocation?: DataCollectionLocation;

    @Column()
    dataCollectionGeography?: DataCollectionGeography;

    @Column()
    locationName : string;

    @DeleteDateColumn()
    deletedAt?: Date;

}