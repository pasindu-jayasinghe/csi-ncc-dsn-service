import { DataRequestStatus } from "src/masterdata/entity/datarequst-status.entity";
import { User } from "src/users/user.entity";

export class ProjectDataAssignRequest {
    requestIdList: number[];
    dataEntryUser: User;
    dataRequestStatus: DataRequestStatus;
    dataEntryDeadline: Date;
    tempUserId: number;
    comment: string;
}