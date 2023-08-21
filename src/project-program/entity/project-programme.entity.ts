import { ProjectProgramData } from './project-program-data.entity';
import { Currency } from '../../masterdata/entity/currency.entity';
import { SDBenefit } from './../../masterdata/entity/sd-benefit.entity';
import { DivisionalSecretariat } from 'src/masterdata/entity/divisional.secretariat.entity';
import { District } from 'src/masterdata/entity/district.entity';
import { Province } from 'src/masterdata/entity/provice.entity';
import { ProjectStatus } from './project-status.entity';
import { SubSector } from './../../parameter/entity/sub.sector.entity';
import { Sector } from './../../parameter/entity/sector.entity';
import { ClimateChangeDataCategory } from './../../parameter/entity/climate.change.data.category.entity';
import { type } from 'os';
import { ProjectType } from './project-type.entity';
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { MasterData } from "src/shared/entities/master.data.entity";
import { BaseEntity, Column, Entity, PrimaryGeneratedColumn, JoinColumn, ManyToOne, DeleteDateColumn } from "typeorm";
import { FinancingScheme } from 'src/masterdata/entity/financing-scheme.entity';
import { Institution } from 'src/institution/institution.entity';


@Entity()
export class ProjectProgramme extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();
        this.longitude = 0;
        this.latitude = 0;
        this.ghgEmissions = "";
        this.adaptationBenefits = "";
        this.publicDonor = false;
        this.privateDonor = false;
        this.privatePublicDonor = false;
        this.ngoDonor = false;
        this.createdBy = "";
        this.editedBy = "";
        this.isPublicProponent = false;
    }

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({ length: 2500 })
    description: string;

    @Column()
    isProject: boolean;

    @Column()
    proposedDateOfCommence: Date;

    @Column({ type: "decimal", precision: 5, scale: 1, default: 0 })
    projectDuration: number;

    @Column({ length: 2500, default: null })
    scope: string;

    @Column({ type: "decimal", precision: 10, scale: 6, default: 0, nullable: true })
    longitude: number;

    @Column({ type: "decimal", precision: 10, scale: 6, default: 0, nullable: true })
    latitude: number;

    @Column({ default: null, nullable: true })
    ghgEmissions: string;

    @Column({ default: null, nullable: true })
    adaptationBenefits: string;

    @Column({ default: false, nullable: true })
    isPublicProponent: boolean;

    @Column({ default: null, length: 2500, nullable: true })
    partiesInvolved: string;

    @Column({ default: false, nullable: true })
    publicDonor: boolean;

    @Column({ default: false, nullable: true })
    privateDonor: boolean;

    @Column({ default: false, nullable: true })
    internationalDonor: boolean;

    @Column({ default: false, nullable: true })
    privatePublicDonor: boolean;

    @Column({ default: false, nullable: true })
    ngoDonor: boolean;

    @Column({ type: "decimal", precision: 10, scale: 6, default: null, nullable: true })
    totalProjectCost: number;

    @ManyToOne(type => Currency, { cascade: false, nullable: true })
    @JoinColumn()
    totalProjectCostCurrency?: Currency;

    @ManyToOne(type => FinancingScheme, { cascade: false, nullable: true })
    @JoinColumn()
    financingScheme?: FinancingScheme;


    @ManyToOne(type => SDBenefit, { cascade: false, nullable: true })
    @JoinColumn()
    directSDBenefit?: SDBenefit;


    @ManyToOne(type => SDBenefit, { cascade: false, nullable: true })
    @JoinColumn()
    indirectSDBenefit?: SDBenefit;

    @Column({ nullable: true })
    isNational?: boolean;

    @Column({ nullable: true })
    isSpecificLocation?: boolean;

    @ManyToOne(type => Province, { cascade: false },)
    @JoinColumn()
    province?: Province;

    @ManyToOne(type => District, { cascade: false })
    @JoinColumn()
    district?: District;


    @ManyToOne(type => DivisionalSecretariat, { cascade: false })
    @JoinColumn()
    divisionalSecretariat?: DivisionalSecretariat;

    @ManyToOne(type => ProjectStatus, { cascade: false })
    @JoinColumn()
    projectStatus?: ProjectStatus;

    @ManyToOne(type => ClimateChangeDataCategory, { cascade: false })
    @JoinColumn()
    climateChangeDataCategory?: ClimateChangeDataCategory;

    @ManyToOne(type => Sector, { cascade: false })
    @JoinColumn()
    sector?: Sector;

    @ManyToOne(type => SubSector, { cascade: false })
    @JoinColumn()
    subSector?: SubSector;


    @ManyToOne(type => ProjectType, { cascade: false })
    @JoinColumn()
    projectType?: ProjectType;

    @ManyToOne(type => Institution, { eager: true })
    @JoinColumn()
    dataSource: Institution;

    @Column({ default: null, length: 2500, nullable: true })
    outcomes: string;

    @Column({ default: null, nullable: true })
    projectProponents: string;

    @Column({ default: null, nullable: true })
    implementingEntities: string;

    @Column({ default: null, nullable: true })
    executingEntity: string;

    @Column({ default: null, nullable: true })
    beneficiaries: string;

    @DeleteDateColumn()
    deletedAt?: Date;

    @Column({ default: 0 })
    isPendingApprove?: boolean;

    documentCount: number;

    publishDataCount: number;

    publishLatestUpdate: string;

    projectProgrammeData: ProjectProgramData[]
}