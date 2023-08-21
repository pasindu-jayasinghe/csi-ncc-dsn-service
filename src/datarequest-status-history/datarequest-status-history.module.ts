import { UsersModule } from './../users/users.module';
import { Userv2Module } from './../userv2/userv2.module';
import { User } from './../users/user.entity';
import { Userv2Service } from './../userv2/userv2.service';
import { DataRequestStatusHistory } from './../masterdata/entity/datarequst-status-history.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { DatarequestStatusHistoryController } from './datarequest-status-history.controller';
import { DatarequestStatusHistoryService } from './datarequest-status-history.service';
import { Repository } from "typeorm";


@Module({
  imports: [TypeOrmModule.forFeature([DataRequestStatusHistory]), Userv2Module, UsersModule],
  controllers: [DatarequestStatusHistoryController],
  providers: [DatarequestStatusHistoryService],
  exports: [DatarequestStatusHistoryService]
})
export class DatarequestStatusHistoryModule { }
