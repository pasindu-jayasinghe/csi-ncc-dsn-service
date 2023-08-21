import { User } from './../../users/user.entity';
import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { DatarequestStatusHistoryModule } from "src/datarequest-status-history/datarequest-status-history.module";
import { InstitutionModule } from "src/institution/institution.module";
import { MasterdataModule } from "src/masterdata/masterdata.module";
import { PolicyData } from "../entity/policy-data.entity";
import { PolicyModule } from "../policy.module";
import { PolicyDataController } from "./policy-data.controller";
import { PolicyDataService } from "./policy-data.service";

@Module({
    imports: [TypeOrmModule.forFeature([PolicyData, User]), PolicyModule, MasterdataModule, DatarequestStatusHistoryModule, InstitutionModule],
    controllers: [PolicyDataController],
    providers: [PolicyDataService]
})
export class PolicyDataModule { }