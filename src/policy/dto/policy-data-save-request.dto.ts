import { DataRequestStatus } from "src/masterdata/entity/datarequst-status.entity";

export class PolicyDataSaveRequest{
    policyDataId: number;
    amendments: string;
    submitForReview: boolean;
    dataRequestStatus: DataRequestStatus;
    tempUserId: number;
}