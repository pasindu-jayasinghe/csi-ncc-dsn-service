import { BaseTrackingEntity } from 'src/shared/base.tracking.entity';
import { UnitOfMeasure } from 'src/parameter/entity/unitofmeasure.entity';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class UomConversion extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(type => UnitOfMeasure, { eager: true, cascade: false })
    @JoinColumn()
    unitOfMeasure?: UnitOfMeasure;

    @ManyToOne(type => UnitOfMeasure, { eager: true, cascade: false })
    @JoinColumn()
    relatedUnitOfMeasure?: UnitOfMeasure;

    @Column({ type: "decimal", precision: 20, scale: 6, default: 0 })
    conversionValue: number;


}