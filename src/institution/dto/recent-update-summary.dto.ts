import { Status } from './../../services/wos-api/wos.api.service';

export class RecentUpdateSummary {
    Status: string;
    ParameterCount: number;
    ProjectCount: number;
    ProgrammeCount: number;
    PolicieCount: number;
}