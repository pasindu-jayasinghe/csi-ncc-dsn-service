import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { KeyClockService } from 'src/auth/keycloak-nodejs-admin-client/keyclock.service';
import { Institution } from 'src/institution/institution.entity';
import { User } from './user.entity';
import { UserType } from './user.type.entity';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { UserDataUsageCategoryService } from './user-data-usage-category/user-data-usage-category.service';
import { UserDataUsageCategoryController } from './user-data-usage-category/user-data-usage-category.controller';
import { UserDataUsageCategoryModule } from './user-data-usage-category/user-data-usage-category.module';

@Module({
  imports: [TypeOrmModule.forFeature([User, UserType, Institution])],
  providers: [UsersService, KeyClockService,],
  controllers: [UsersController],
  exports: [UsersService],
})
export class UsersModule { }
