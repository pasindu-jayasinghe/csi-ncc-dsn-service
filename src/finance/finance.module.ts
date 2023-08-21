import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Userv2Module } from 'src/userv2/userv2.module';
import { ShoppingCartController } from './controller/shopping-cart.controller';
import { ShoppingCartItem } from './entity/shopping-cart-item.entity';
import { ShoppingCart } from './entity/shopping-cart.entity';
import { ShoppingCartPayment } from './entity/shopping-cart.payment.entity';
import { ShoppingCartItemService } from './service/shopping-cart-item.service';
import { ShoppingCartPaymentService } from './service/shopping-cart.payment.service';
import { ShoppingCartService } from './service/shopping-cart.service';

@Module({
    imports: [TypeOrmModule.forFeature([ShoppingCart, ShoppingCartItem, ShoppingCartPayment]), Userv2Module],
    controllers: [ShoppingCartController],
    providers: [ShoppingCartService, ShoppingCartItemService, ShoppingCartPaymentService],
    exports: [ShoppingCartService, ShoppingCartItemService, ShoppingCartPaymentService]
})
export class FinanceModule { }