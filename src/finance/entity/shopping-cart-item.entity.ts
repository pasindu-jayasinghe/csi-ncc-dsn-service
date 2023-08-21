import { BaseTrackingEntity } from "src/shared/base.tracking.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { ShoppingCart } from "./shopping-cart.entity";

@Entity()
export class ShoppingCartItem extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(type => ShoppingCart)
    @JoinColumn()
    shoppingCart: ShoppingCart;   

    @Column()
    parameterLocationDataId?: number;

    @Column()
    parameterId?: number;

    @Column()
    parameterName: string;

    @Column({length: 2500})
    parameterDescription: string;

    @Column()
    parameterLocation: string;

    @Column()
    dataProvider: string;

    @Column()
    value: string;

    @Column()
    unit: string;

    @Column()
    dataValidFrom?: Date;

    @Column()
    dataValidTo?: Date;

    @Column()
    price: number;

    @Column()
    frequency: string;

    @Column()
    isActiveInCart: boolean;
}