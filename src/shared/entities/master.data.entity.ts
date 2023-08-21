import { Column, PrimaryGeneratedColumn } from "typeorm";
import { BaseTrackingEntity } from "../base.tracking.entity";

export abstract class MasterData extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();
        
    }

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({length: 2500})
    description: string;

    @Column()
    sortOrder: number

}