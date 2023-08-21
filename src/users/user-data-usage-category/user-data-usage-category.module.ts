import { UserDataUsageCategoryController } from './user-data-usage-category.controller';
import { UserDataUsageCategoryService } from './user-data-usage-category.service';
import { UserDataUsageCategory } from './../user-data-usage-category.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';

@Module({
    imports: [TypeOrmModule.forFeature([UserDataUsageCategory])],
    providers: [UserDataUsageCategoryService],
    controllers: [UserDataUsageCategoryController],
    exports: [UserDataUsageCategoryService],
})
export class UserDataUsageCategoryModule { }
