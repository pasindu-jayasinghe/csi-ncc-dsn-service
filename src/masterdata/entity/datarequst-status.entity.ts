import { MasterData } from 'src/shared/entities/master.data.entity';
import { Entity } from 'typeorm';

@Entity()
export class DataRequestStatus extends MasterData {

}


export enum DataRequestStatusEnum {
    Needtoassign = 1,
    SubmittedtoCCS = 2,
    PendingDataEntry = 3,
    Rejectedandreassigned = 4,
    RejectedfromtheCCS = 5,
    Needtoreview = 6,
    Publish = 7,
    CancelfromtheCCS = 8,
    RejectedfromtheIA = 9,

}