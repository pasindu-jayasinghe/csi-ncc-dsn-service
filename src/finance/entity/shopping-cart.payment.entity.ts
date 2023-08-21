import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { ShoppingCart } from "./shopping-cart.entity";



@Entity()
export class ShoppingCartPayment extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    TransactionAmount : number;

    @ManyToOne(type => ShoppingCart, cart => cart.shoppingCartPayments, { eager: true })
    @JoinColumn()
    shoppingCart: ShoppingCart;   

    @Column()
    isSuccess: boolean;

    @Column()
    TransactionStatus : string;

    @Column()
    TransactionReferenceNumber : string;

    @Column()
    PaymentGatewayName :string;

    @Column()
    ConvenienceFee : string;

    @Column()
    Note : string;


}