import { DataUsageCategory } from './../data-usage-category.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { UserDataUsageCategory } from './../user-data-usage-category.entity';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Injectable } from '@nestjs/common';

@Injectable()
export class UserDataUsageCategoryService extends TypeOrmCrudService<UserDataUsageCategory> {
    constructor(@InjectRepository(UserDataUsageCategory) repo) {
        super(repo);
    }

    async getUserDataCategory(email: string): Promise<UserDataUsageCategory> {
        return await this.repo.findOne({
            where: { email: email },
        });
    }

    async updateUserDataCategory(email: string, catagry: DataUsageCategory): Promise<boolean> {
        let user = await this.repo.findOne({
            where: { email: email },
        });

        let saveSucess = false;

        if (user && user.id > 0) {
            let updatedItem = await this.repo.createQueryBuilder().update(UserDataUsageCategory)
                .set({
                    dataUsageCategory: catagry
                })
                .where("id = :id", { id: user.id })
                .execute();
            saveSucess = true;
        }
        else {
            let udc = new UserDataUsageCategory();
            udc.email = email;
            udc.dataUsageCategory = catagry;
            udc.createdOn = new Date();
            udc.editedOn = new Date();
            udc.createdBy = email;
            udc.editedBy = email;
            this.repo.save(udc)
            saveSucess = true;

        }


        return saveSucess;
    }

}
