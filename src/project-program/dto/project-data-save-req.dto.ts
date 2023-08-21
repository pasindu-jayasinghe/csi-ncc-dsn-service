import { DataRequestStatus } from "src/masterdata/entity/datarequst-status.entity";
import { ProjectStatus } from "../entity/project-status.entity";

export class ProjectDataSaveRequest{
    projectProgramDataId: number;
    projectStatus: ProjectStatus;
    projectProgress: string;
    submitForReview: boolean;
    dataRequestStatus: DataRequestStatus;
    tempUserId: number;
}