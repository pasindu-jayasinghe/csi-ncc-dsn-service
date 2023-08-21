import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { KeyClockService } from 'src/auth/keycloak-nodejs-admin-client/keyclock.service';
import { User } from 'src/users/user.entity';
import { Userv2Controller } from './userv2.controller';
import { Userv2Service } from './userv2.service';

@Module({
  imports: [TypeOrmModule.forFeature([User])],
  providers: [Userv2Service, KeyClockService],
  exports: [Userv2Service],
  controllers: [Userv2Controller],
})
export class Userv2Module {}
