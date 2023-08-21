import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { TypeOrmCrudService } from "@nestjsx/crud-typeorm";
import { Userv2Service } from "src/userv2/userv2.service";
import { ShoppingCartPayment } from "../entity/shopping-cart.payment.entity";

@Injectable()
export class ShoppingCartPaymentService extends TypeOrmCrudService<ShoppingCartPayment> {
    constructor(@InjectRepository(ShoppingCartPayment) repo, public userService: Userv2Service) {
        super(repo);
    }

    async createOnePayment(payemnt: ShoppingCartPayment): Promise<ShoppingCartPayment> {

        let newpayment = await this.repo.save(payemnt);

        return newpayment;

    }
    async updatePaymentResponse(
        transactionID: number,
        transactionStatus: string,
        transactionReferenceNumber: string,
        paymentGatewayName: string,
        convenienceFee: string,
        dataHash: string): Promise<ShoppingCartPayment> {

        let payment = await this.repo.findOne(transactionID);
        payment.TransactionStatus = transactionStatus;
        payment.TransactionReferenceNumber = transactionReferenceNumber;
        payment.PaymentGatewayName = paymentGatewayName;
        payment.ConvenienceFee = convenienceFee;

        let updatedpayment = await this.repo.save(payment);

        return updatedpayment;

    }

}