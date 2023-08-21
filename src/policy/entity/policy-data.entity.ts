import { Documents } from "src/document/entity/document.entity";
import { DataRequestStatus } from "src/masterdata/entity/datarequst-status.entity";
import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { User } from "src/users/user.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Policy } from "./policy.entity";

@Entity()
export class PolicyData extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();
        this.documents = new Array();
    }

    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(type => Policy, { eager: true })
    @JoinColumn()
    policy?: Policy;

    @Column()
    institutionId?: number;

    @Column()
    year?: number;

    @Column()
    requestedDate?: Date;

    @Column({ default: null, nullable: true })
    deadline?: Date;

    @Column({ default: null, nullable: true })
    dataEntryDeadline?: Date;

    @ManyToOne(type => User)
    @JoinColumn()
    dataEntryUser?: User;

    @Column({ default: null, nullable: true, length: 2500 })
    amendments: string;

    @ManyToOne(type => DataRequestStatus)
    @JoinColumn()
    dataRequestStatus?: DataRequestStatus;

    // any note while data request
    @Column({ default: null, nullable: true })
    dataRequestNote: string;

    //comment from data entry user
    @Column({ default: null, nullable: true })
    noteDataEntry: string;

    // comment from data source admin while proving
    @Column({ default: null, nullable: true })
    noteDataApprover: string;

    // comment from CCS user
    @Column({ default: null, nullable: true })
    noteDataCCS: string;

    // chat conversation resource url   
    @Column({ default: null, nullable: true })
    chatURL: string;

    documents: Documents[];
}