import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ShoppingCartItem } from '../entity/shopping-cart-item.entity';
import { CartStatusEnum, ShoppingCart } from '../entity/shopping-cart.entity';

@Injectable()
export class ShoppingCartItemService extends TypeOrmCrudService<ShoppingCartItem> {
    constructor(@InjectRepository(ShoppingCartItem) repo) {
        super(repo);
    }

    async updateItem(item: ShoppingCartItem) {
        return this.repo.update(item.id, item).then(updatedItem => {
            return updatedItem;
        });
    }

    async createItem(item: ShoppingCartItem) {
        return this.repo.save(item).then(savedItem => {
            return savedItem;
        });
    }

    async isItemInActiveCart(userEmail: string, parameterDataId: number) {
        let filter = "ci.parameterLocationDataId = :parameterDataId AND ci.isActiveInCart = :isActiveInCart AND c.userEmail = :userEmail AND c.cartStatus = :cartStatus";
        let params = { parameterDataId: parameterDataId, isActiveInCart: true, userEmail: userEmail, cartStatus: CartStatusEnum.New }
        let query = this.repo.createQueryBuilder("ci")
            .innerJoinAndMapOne('ci.shoppingCart', ShoppingCart, 'c', 'ci.shoppingCartId = c.id')
            .where(filter, params);

        //console.log(query.getQueryAndParameters());

        let data = await query.execute();

        if (data && data.length > 0) {
            return true;
        }
        return false;
    }

    async hasAlreadyPaidForItem(userEmail: string, parameterDataId: number) {
        let filter = "ci.parameterLocationDataId = :parameterDataId AND c.userEmail = :userEmail AND c.cartStatus = :cartStatus";
        let params = { parameterDataId: parameterDataId, userEmail: userEmail, cartStatus: CartStatusEnum.Paid }
        let data = await this.repo.createQueryBuilder("ci")
            .innerJoinAndMapOne('ci.shoppingCart', ShoppingCart, 'c', 'ci.shoppingCartId = c.id')
            .where(filter, params)
            .execute();
        if (data && data.length > 0) {
            return true;
        }
        return false;
    }

    async getItem(id: number) {
        let filter = "ci.id = :id";
        let params = { id: id }
        let data = await this.repo.createQueryBuilder("ci")
            .innerJoinAndMapOne('ci.shoppingCart', ShoppingCart, 'c', 'ci.shoppingCartId = c.id')
            .where(filter, params)
            .execute();

        return data;
    }
}