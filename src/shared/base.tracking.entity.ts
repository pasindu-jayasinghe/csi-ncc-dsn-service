import { Column, PrimaryGeneratedColumn } from "typeorm";

export abstract class BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        
        this.createdBy = "-";
        this.createdOn = new Date();

        this.editedBy = "-";
        this.editedOn = new Date();
        this.status = 0;
    }
    
    @Column()
    createdBy?: string;
    
    @Column()
    createdOn?: Date;
    
    @Column()
    editedBy: string;
    
    @Column()
    editedOn?: Date;

    @Column()
    status: RecordStatus;
    
}

export enum RecordStatus {

    Deleted =-20,
    InActive = -10,
    Active = 0,
 
}