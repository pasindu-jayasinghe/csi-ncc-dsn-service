import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { Column, Entity, JoinTable, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { ShoppingCartItem } from "./shopping-cart-item.entity";
import { ShoppingCartPayment } from "./shopping-cart.payment.entity";

@Entity()
export class ShoppingCart extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    userEmail: string;

    @Column()
    sessionId: string;

    @Column()
    token: string;

    @Column()
    cartStatus: CartStatusEnum;

    @Column({ default: null, nullable: true })
    firstName: string;

    @Column({ default: null, nullable: true })
    lastName: string;

    @Column({ default: null, nullable: true })
    phoneNumber: string;

    @Column({ default: null, nullable: true })
    email: string;

    @Column({ default: null, nullable: true })
    streetAddress: string;

    @Column({ default: null, nullable: true })
    city: string;

    @Column({ default: null, nullable: true })
    province: string;

    @Column({ default: null, nullable: true })
    postalCode: number;

    @Column({ default: null, nullable: true })
    country: string;

    @OneToMany(type => ShoppingCartItem, cartItem => cartItem.shoppingCart, { eager: true })
    @JoinTable()
    cartItems: ShoppingCartItem[];

    @OneToMany(type => ShoppingCartPayment, shoppingCartPayment => shoppingCartPayment.shoppingCart,)
    @JoinTable()
    shoppingCartPayments: ShoppingCartPayment[];
}

export enum CartStatusEnum {
    New = 1,
    Checkout = 2,
    Paid = 3,
    Complete = 4,
    Abandoned = 5,
}