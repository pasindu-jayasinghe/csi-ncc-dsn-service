import { ParameterLocationData } from './parameter-location-data.entity';
import { Institution } from "src/institution/institution.entity";
import { District } from "src/masterdata/entity/district.entity";
import { DivisionalSecretariat } from "src/masterdata/entity/divisional.secretariat.entity";
import { Province } from "src/masterdata/entity/provice.entity";
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn, JoinTable, DeleteDateColumn } from "typeorm";
import { Parameter } from "./parameter.entity";

@Entity()
export class ParameterLocation extends BaseTrackingEntity {


    constructor() {
        super();
        this.createdBy = "-";
        this.createdOn = new Date();

        this.editedBy = "-";
        this.editedOn = new Date();
        this.status = 0;
    }
    
    @PrimaryGeneratedColumn()
    id: number;


    @OneToMany(type => ParameterLocationData, pl => pl.parameterLocation)
    @JoinTable()
    parameterLocation: ParameterLocationData[];


    @ManyToOne(type => Parameter)
    @JoinColumn()
    parameter: Parameter;

    @Column()
    isNational: boolean;
    
    @Column()
    isSpecificLocation: boolean;

    @ManyToOne(type => Province)
    @JoinColumn()
    province?: Province;

    @ManyToOne(type => District)
    @JoinColumn()
    district?: District;

    @ManyToOne(type => DivisionalSecretariat)
    @JoinColumn()
    divisionalSecretariat?: DivisionalSecretariat;

    @ManyToOne(type => Institution, {
        eager: true
    })
    @JoinColumn()
    dataSource: Institution;

    @DeleteDateColumn()
    deletedAt?: Date;



}