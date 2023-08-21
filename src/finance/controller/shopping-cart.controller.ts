import { Body, Controller, Get, Post, Query, Request, Response } from '@nestjs/common';
import {
  Crud,
  CrudController
} from '@nestjsx/crud';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { ShoppingCartService } from '../service/shopping-cart.service';
import { ShoppingCart } from '../entity/shopping-cart.entity';
import { ShoppingCartUpdateResponseDto } from '../dto/shopping-cart-update-response.dto';
import { PurchaseParameterDataRecordDto } from 'src/parameter/dto/purchase-parameter-data-record.dto';
import { Unprotected } from 'nest-keycloak-connect';

@Crud({
  model: {
    type: ShoppingCart,
  },
})
@Controller('shopping-cart')
export class ShoppingCartController implements CrudController<ShoppingCart> {
  constructor(public service: ShoppingCartService) { }

  get base(): CrudController<ShoppingCart> {
    return this;
  }

  @Post("add-item")
  async addItemToCart(@Request() req, @Body() dto: PurchaseParameterDataRecordDto): Promise<ShoppingCartUpdateResponseDto> {
    let userEmail = req.user.email;
    let response = await this.service.addItemToCart(dto, userEmail);
    //  console.log("response ======================", response);
    return response;
  }

  @Post("remove-item/:parameterDataId")
  async removeItemFromCart(@Request() req, @Query('parameterDataId') parameterDataId: number): Promise<ShoppingCartUpdateResponseDto> {
    //console.log("remove-item/:parameterDataId");
    let userEmail = req.user.email;
    let response = await this.service.removeItemFromCart(parameterDataId, userEmail);
    //console.log("response ======================", response);

    return response;
  }

  @Get("summary")
  async getActiveCartSummary(@Request() req): Promise<ShoppingCartUpdateResponseDto> {
    let userEmail = req.user.email;
    let response = this.service.getActiveCartSummary(userEmail);
    return response;
  }

  //@Unprotected()
  @Post("checkout")
  async checkout(@Request() req): Promise<any> {
    let userEmail = req.user?.email;
    // create a payment record
    console.log("checkout email", userEmail);

   

    console.log("checkout email", userEmail);

    let newPayment = await this.service.createPaymentRequest(userEmail);
    console.log("newpayment", newPayment);

    let paymentUrl = process.env.paymebtPageUrl;

    // let url = paymentUrl + "?ServiceCode=dotnetclient&TransactionRefNo=" + newPayment.id + "&TransactionAmount=" + newPayment.TransactionAmount;
    let url = paymentUrl + "?serviceCode=TEST20001&transactionRefNo=" + newPayment.id + "&transactionAmount=" + newPayment.TransactionAmount;
    
    // redirect to payment page
    //let response = this.service.getActiveCartSummary(userEmail);
    return {url : url};

  }

  @Unprotected()
  @Get("checkout-response")
  async checkoutResponse(@Request() req, @Response() res,
    @Query('transactionID') transactionID: number,
    @Query('transactionStatus') transactionStatus: string,
    @Query('transactionReferenceNumber') transactionReferenceNumber: string,
    @Query('paymentGatewayName') paymentGatewayName: string,
    @Query('convenienceFee') convenienceFee: string,
    @Query('dataHash') dataHash: string,) {
    
    
  

    // update the payment record if and aonly if the first response, we will ignore consecative updates
    let payment = await this.service.updatePaymentResponse( transactionID,
      transactionStatus,
      transactionReferenceNumber,
      paymentGatewayName,
      convenienceFee,
      dataHash)
    // update shoping cart items

    if (transactionStatus == "False") {
      res.redirect(process.env.paymentEndPageUrl + '?paymentupdate=false&transactionReferenceNumber'+transactionReferenceNumber);
    } else {
      res.redirect(process.env.paymentEndPageUrl + '?paymentupdate=true');
    }

    // redirect to shoping cart page ( so user can download data)

  }

  @Get("get-paid-cart")
  async getPaidCartSummary(@Request() req,
  @Query('transactionReferenceNumber') transactionReferenceNumber: string): Promise<ShoppingCartUpdateResponseDto> {

    let userEmail = req.user.email;
    
    if (!userEmail) {
      userEmail = "superadmin@ccsdsnlk.lk";
    }
    
    let response = this.service.getPaidCartSummary(userEmail, transactionReferenceNumber);
    return response;

  }




}
