
import { UomConversion } from "src/masterdata/uom-conversion/entity/uom-conversion.entity";
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { Column, Entity, JoinTable, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class UnitOfMeasure extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();

    }

    @PrimaryGeneratedColumn()
    id: number;

    //https://ucum.org/ucum.html
    // meter , second, candela 
    @Column()
    name: string;

    @Column({ length: 2500 })
    description: string;

    //mass , pressure  , length etc
    @Column()
    kindOfQuantity: string;

    //m, s, cd
    @Column()
    print: string;

    //whether this is a metric unit
    @Column()
    isAMetricUnit: boolean;

    // 0.0001
    @Column()
    definitionValue: number;

    //1 × 10-4 
    @Column()
    definitionValueText: string;

    //g, T, m2, [pi].rad/360 etc...
    @Column()
    definitionUnit: string;

    @OneToMany(type => UomConversion, pl => pl.unitOfMeasure)
    @JoinTable()
    UomConversions?: UomConversion[];



}