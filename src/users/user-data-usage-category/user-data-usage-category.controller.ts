import { DataUsageCategory } from './../data-usage-category.entity';
import { UserDataUsageCategory } from './../user-data-usage-category.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Crud, CrudController } from '@nestjsx/crud';
import { Body, Controller, Get, Param, Post, Request } from '@nestjs/common';
import { Repository } from 'typeorm';
import { UserDataUsageCategoryService } from './user-data-usage-category.service';

@Crud({
    model: {
        type: UserDataUsageCategory,
    },
    query: {
        join: {
            dataUsageCategory: {
                eager: true,
            },
        },

        // this works
        // filter: {
        //   id: {
        //     $eq: 1,
        //   }
        // }

    }


})
@Controller('user-data-usage-category')
export class UserDataUsageCategoryController implements CrudController<UserDataUsageCategory> {

    constructor(
        public service: UserDataUsageCategoryService
    ) { }


    @Get('getUserDataCategory')
    getUserDataCategory(@Request() req): Promise<UserDataUsageCategory> {
        let userEmail = req.user.email;
        return this.service.getUserDataCategory(userEmail);
    }

    @Post('updateUserDataCategory')
    async updateUserDataCategory(@Body() usageCategory: DataUsageCategory, @Request() req): Promise<boolean> {
        let userEmail = req.user.email;
        return await this.service.updateUserDataCategory(userEmail, usageCategory);
    }
}
