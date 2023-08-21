import { Institution } from "src/institution/institution.entity";
import { ClimateChangeDataCategory } from "src/parameter/entity/climate.change.data.category.entity";
import { Sector } from "src/parameter/entity/sector.entity";
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { MasterData } from "src/shared/entities/master.data.entity";
import { BaseEntity, Column, DeleteDateColumn, Entity, JoinColumn, JoinTable, ManyToMany, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Influence } from "./influence.entity";

@Entity()
export class Policy extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();
        this.description = "";
        this.influence = 1;
        this.createdBy = "";
        this.editedBy = "";
        this.status = 0;
    }

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({ length: 2500 })
    description: string;

    @ManyToMany(type => ClimateChangeDataCategory, { eager: true, cascade: false })
    @JoinTable({ name: 'policy_climatechangedatacategory' })
    climateChangeDataCategory?: ClimateChangeDataCategory[];


    @ManyToMany(type => Sector, { eager: true, cascade: false })
    @JoinTable({ name: 'policy_sector' })
    sector: Sector[];

    @Column()
    proposedDateOfCommence: Date;

    @Column()
    influence?: Influence;


    @Column({ default: null, nullable: true })
    originalFormulationInstitution?: string;


    @ManyToOne(type => Institution, { cascade: false })
    @JoinColumn()
    formulationInstitution?: Institution;


    @Column({ default: 0 })
    isPendingApprove?: boolean;



    @DeleteDateColumn()
    deletedAt?: Date;

    documentCount: number;

    publishDataCount: number;

    publishLatestUpdate: string;
}