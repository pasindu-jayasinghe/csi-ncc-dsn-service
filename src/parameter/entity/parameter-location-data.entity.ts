import { Documents } from 'src/document/entity/document.entity';
import { UomConversionService } from './../../masterdata/uom-conversion/uom-conversion.service';
import { DataRequestStatus } from './../../masterdata/entity/datarequst-status.entity';
import { User } from 'src/users/user.entity';
import { type } from 'os';
import { FrequencyDetail } from './../../masterdata/entity/frequency-details.entity';
import { Frequency } from './../../masterdata/entity/frequency.entity';
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { UnitOfMeasure } from "src/parameter/entity/unitofmeasure.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { ParameterLocation } from "./parameter-location.entity";
import { Parameter } from "./parameter.entity";
import { join } from 'path';
import { UomConversion } from 'src/masterdata/uom-conversion/entity/uom-conversion.entity';

@Entity()
export class ParameterLocationData extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(type => ParameterLocation, { cascade: false })
    @JoinColumn()
    parameterLocation: ParameterLocation;

    @Column()
    parameterId?: number;

    @Column()
    requestedDate?: Date;

    @Column({ default: null, nullable: true })
    requestdYear?: number;

    @ManyToOne(type => Frequency, { cascade: false })
    @JoinColumn()
    frequency?: Frequency;

    @ManyToOne(type => FrequencyDetail, { cascade: false })
    @JoinColumn()
    frequencyDetail?: FrequencyDetail;

    @Column()
    startDate?: Date;

    @Column()
    endDate?: Date;

    @Column({ default: null, nullable: true })
    deadline?: Date;

    @Column({ default: null, nullable: true })
    reasonforExceedRange?: string;

    @Column({ default: null, nullable: true })
    dataEnteryDeadline?: Date;

    @Column({ default: null, nullable: true })
    value: string;

    @Column({ default: null, nullable: true })
    conversionUnitOfMeasurevalue: string;

    @ManyToOne(type => UnitOfMeasure, { cascade: false, nullable: true })
    @JoinColumn()
    unitOfMeasureDataEntry?: UnitOfMeasure;

    @ManyToOne(type => UomConversion, { cascade: false, nullable: true })
    @JoinColumn()
    conversionUOMeDataEntry?: UomConversion;

    @ManyToOne(type => User)
    @JoinColumn()
    dataEntryUser?: User;

    @ManyToOne(type => DataRequestStatus, { cascade: false, nullable: true })
    @JoinColumn()
    dataRequestStatus?: DataRequestStatus

    @Column({ default: null, nullable: true })
    dataEntryDeadLine?: Date;


    @Column({ default: null, nullable: true })
    valueInParameterStandard: string;

    @ManyToOne(type => UnitOfMeasure, { cascade: false, nullable: true, })
    @JoinColumn()
    unitOfMeasureInParameterStandard?: UnitOfMeasure;

    // any note while data request
    @Column({ default: null, nullable: true })
    dataRequestNote: string;

    //coment from data entry user
    @Column({ default: null, nullable: true })
    notedataEntry: string;

    // coment from data source admin while proving
    @Column({ default: null, nullable: true })
    notedataApprover: string;

    // comment from CCS user
    @Column({ default: null, nullable: true })
    notedataCCS: string;

    // chat conversation resource url   
    @Column({ default: null, nullable: true })
    chatURL: string;

    @Column({ default: null, nullable: true, length: 2500 })
    contentComment: string;


    contentCommentRequired: boolean;

    comment: string;

    historicalMinimum: number;

    historicalMaximum: number;

    dataEntryValue: number;

    isValiddataEntryValue: boolean;

    parameter: Parameter;

    validTimeDuration: string;

    uomConversions?: UomConversion[];

    documents: Documents[];


}