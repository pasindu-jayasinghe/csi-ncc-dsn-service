import { User } from './../../users/user.entity';
export class RequestAssignSummary {

    User: User;
    UserName: string;
    ParameterCount: number;
    ProjectCount: number;
    ProgrammeCount: number;
    PolicieCount: number;

}