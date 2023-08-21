import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { User } from 'src/users/user.entity';
import { Userv2Service } from 'src/userv2/userv2.service';
import { ShoppingCartItem } from '../entity/shopping-cart-item.entity';
import { CartStatusEnum, ShoppingCart } from '../entity/shopping-cart.entity';
import { ShoppingCartItemService } from './shopping-cart-item.service';
import { v4 as uuidv4 } from 'uuid';
import { RecordStatus } from 'src/shared/base.tracking.entity';
import { ShoppingCartUpdateResponseDto } from '../dto/shopping-cart-update-response.dto';
import { Logger } from '@nestjs/common';
import { ShoppingCartPaymentService } from './shopping-cart.payment.service';
import { ShoppingCartPayment } from '../entity/shopping-cart.payment.entity';
import { CrudRequest } from '@nestjsx/crud';

@Injectable()
export class ShoppingCartService extends TypeOrmCrudService<ShoppingCart> {
  constructor(@InjectRepository(ShoppingCart) repo,
    public cartItemService: ShoppingCartItemService,
    public userService: Userv2Service,
    public shoppingCartPaymentService: ShoppingCartPaymentService) {
    super(repo);
  }

  /**
   * add item to cart
   * @param item 
   * @param userId 
   */
  async addItemToCart(item: any, userEmail: string) {

    let response = new ShoppingCartUpdateResponseDto();
    response.isSuccess = true;
    response.message = "Success";

    // try{
    //check user
    // let user = await this.userService.findOne({
    //   where: { id: userId }
    // }).then(user => {
    //     return user;
    // });

    // if(!user){
    //   response.isSuccess = false;
    //   response.message = "Invalid User";
    //   return response;
    // }

    //get active cart
    let cart = await this.repo.findOne({
      where: { userEmail: userEmail, cartStatus: CartStatusEnum.New },
      order: { id: 'DESC' }
    });

    if (cart) {
      let itemFilter = cart.cartItems.filter(obj => obj.parameterLocationDataId == item.parameterDataId);
      if (itemFilter.length > 0 && itemFilter[0].isActiveInCart) {


        response.message = "Already in cart";
        this.setCartSummaryInResponse(response, cart.cartItems);
        return response;
      }
      if (itemFilter.length > 0 && !itemFilter[0].isActiveInCart) {
        //make record active

        itemFilter[0].isActiveInCart = true;
        itemFilter[0].price = item.isPublicData ? 0 : item.commercialValue;
        await this.cartItemService.updateItem(itemFilter[0]);
        this.setCartSummaryInResponse(response, cart.cartItems);
        return response;
      }
    } else {
      // create new cart
      cart = await this.createNewCartForUser(userEmail);
    }

    //add new item to cart
    let newItem = this.getMappedCartItem(cart, item);
    newItem = await this.cartItemService.createItem(newItem);
    if (cart.cartItems == undefined || cart.cartItems == null) {
      cart.cartItems = new Array();
    }

    response.message = "Success";
    this.setCartSummaryInResponse(response, cart.cartItems);
    console.log(response);

    return response;

    // }catch(error){
    //   Logger.error(error);
    //   response.isSuccess = false;
    //   response.message = "Internal Server Error";
    //   return response;
    // }      
  }

  /**
   * remove item from cart
   * @param item 
   * @param userId 
   */
  async removeItemFromCart(parameterDataId: number, userEmail: string) {
    let response = new ShoppingCartUpdateResponseDto();
    response.isSuccess = true;
    response.message = "Success";

    // // try{
    // //check user
    // let user = await this.userService.findOne({
    //   where: { id: userId }
    // }).then(user => {
    //   return user;
    // });

    // if (!user) {
    //   response.isSuccess = false;
    //   response.message = "Invalid User";
    //   return response;
    // }

    //get active cart
    let cart = await this.repo.findOne({
      where: { userEmail: userEmail, cartStatus: CartStatusEnum.New },
      order: { id: 'DESC' }
    });

    if (cart) {
      let itemFilter = cart.cartItems.filter(obj => obj.parameterLocationDataId == parameterDataId);
      if (itemFilter.length > 0 && itemFilter[0].isActiveInCart) {
        //make record inactive
        itemFilter[0].isActiveInCart = false;
        await this.cartItemService.updateItem(itemFilter[0]);
        this.setCartSummaryInResponse(response, cart.cartItems);
        return response;
      }
      if (itemFilter.length > 0 && !itemFilter[0].isActiveInCart) {
        //make record active
        response.isSuccess = false;
        response.message = "Item is not in cart.";
        return response;
      }
    }

    response.isSuccess = false;
    response.message = "No active cart";
    return response;

    // }catch(error){
    //   Logger.error(error);
    //   response.isSuccess = false;
    //   response.message = "Internal Server Error";
    //   return response;
    // }     
  }


  /**
   * create new cart
   * @param user 
   */
  async createNewCartForUser(userEmail: string) {
    let cart = new ShoppingCart();
    cart.userEmail = userEmail;

    let uniqueId = uuidv4();
    cart.sessionId = uniqueId;
    cart.token = uniqueId;

    cart.cartStatus = CartStatusEnum.New;

    //user details
    // cart.firstName = user.firstName;
    // cart.lastName = user.lastName;
    // cart.phoneNumber = user.mobile;
    // cart.email = user.email;
    // cart.streetAddress = "";//TODO
    // cart.city = "";//TODO
    // cart.province = "";//TODO
    // cart.postalCode = 0;//TODO
    // cart.country = ""; //TODO

    cart.status = RecordStatus.Active;

    return this.repo.save(cart).then(savedItem => {
      return savedItem;
    })
  }

  /**
   * map cart item details
   * @param cart 
   * @param item 
   */
  private getMappedCartItem(cart: ShoppingCart, item: any) {
    let newItem = new ShoppingCartItem();
    newItem.shoppingCart = cart;
    newItem.parameterLocationDataId = item.parameterDataId;
    newItem.parameterId = item.parameterId;
    newItem.parameterName = item.name;
    newItem.parameterDescription = item.description;

    if (item.location.isNational) {
      newItem.parameterLocation = "National";
    } else if (item.location.province) {
      newItem.parameterLocation = "Province: " + item.location.province;
    } else if (item.location.district) {
      newItem.parameterLocation = "District: " + item.location.district;
    } else if (item.location.ds) {
      newItem.parameterLocation = "D.S: " + item.location.ds;
    } else {
      newItem.parameterLocation = "";
    }

    newItem.dataProvider = item.dataProvider;
    newItem.value = item.value;
    newItem.unit = item.unit;
    newItem.dataValidFrom = item.dataValidFrom;
    newItem.dataValidTo = item.dataValidTo;
    newItem.price = item.isPublicData ? 0 : item.commercialValue;
    newItem.frequency = item.frequency;
    newItem.isActiveInCart = true;
    newItem.status = RecordStatus.Active;

    return newItem;
  }

  /**
   * set totals in response
   * @param response 
   * @param cartItems 
   */
  private setCartSummaryInResponse(response: ShoppingCartUpdateResponseDto, cartItems: ShoppingCartItem[], paid : boolean = false) {
    let activeFilter = cartItems.filter(obj => obj.isActiveInCart);
    response.totalItems = activeFilter.length;
    response.totalPrice = activeFilter.map(obj => obj.price).reduce((a, b) => (a ? a : 0) + (b ? b : 0), 0);

    activeFilter.map(x=>{
      x.value = (!paid && x.price) > 0 ? "N/A" : x.value;
    })

    response.cartItemList = activeFilter;
  }

  /**
   * get totals of active cart
   * @param response 
   * @param cartItems 
   */
  async getActiveCartSummary(userEmail: string) {
    let response = new ShoppingCartUpdateResponseDto();
    response.isSuccess = true;
    response.message = "Success";

    // let user = await this.userService.findOne({
    //   where: { id: userId }
    // }).then(user => {
    //   return user;
    // });

    // if (!user) {
    //   response.isSuccess = false;
    //   response.message = "Invalid User";
    //   return response;
    // }

    //get active cart
    let cart = await this.repo.findOne({
      where: { userEmail: userEmail, cartStatus: CartStatusEnum.New },
      order: { id: 'DESC' }
    });

    if (cart) {
      this.setCartSummaryInResponse(response, cart.cartItems);
    } else {
      this.setCartSummaryInResponse(response, []);
    }

    return response;
  }

  /**
   * get totals of active cart
   * @param response 
   * @param cartItems 
   */
  async getPaidCartSummary(userEmail: string, transactionReferenceNumber: string) {
    let response = new ShoppingCartUpdateResponseDto();
    response.isSuccess = true;
    response.message = "Success";

    //get latest paid cart
    let cart = await this.repo.findOne({
      where: { userEmail: userEmail, cartStatus: CartStatusEnum.Paid },
      order: { id: 'DESC' }
    });

    if (cart) {
      this.setCartSummaryInResponse(response, cart.cartItems, true);
    } else {
      this.setCartSummaryInResponse(response, []);
    }

    return response;
  }

  async createPaymentRequest(userEmail: string): Promise<ShoppingCartPayment> {

    // get the cart
    let cart = await this.repo.findOne({
      where: { userEmail: userEmail, cartStatus: CartStatusEnum.New },
      order: { id: 'DESC' }
    });

    if (cart) {

      // create a new payment record
      let newPaymentRecord: ShoppingCartPayment = new ShoppingCartPayment();
      newPaymentRecord.shoppingCart = cart;

      let cartAmount = 0;

      cart.cartItems.map(x => {
        if (x.price && x.price > 0) {
          cartAmount = cartAmount + x.price;
        }
      });

      newPaymentRecord.TransactionAmount = cartAmount;

      newPaymentRecord.TransactionStatus = "new";
      newPaymentRecord.ConvenienceFee = "";
      newPaymentRecord.Note = "";
      newPaymentRecord.PaymentGatewayName = "";
      newPaymentRecord.TransactionReferenceNumber = "";
      newPaymentRecord.editedBy = "";
      newPaymentRecord.isSuccess = false;
      newPaymentRecord.status = 1;
      newPaymentRecord.shoppingCart = cart;

      let payment = await this.shoppingCartPaymentService.createOnePayment(newPaymentRecord);

      return payment;

    } else {
      return null;
    }

  }

  async updatePaymentResponse(
    transactionID: number,
    transactionStatus: string,
    transactionReferenceNumber: string,
    paymentGatewayName: string,
    convenienceFee: string,
    dataHash: string): Promise<ShoppingCartPayment> {

    let payment = await this.shoppingCartPaymentService.updatePaymentResponse(
      transactionID,
      transactionStatus,
      transactionReferenceNumber,
      paymentGatewayName,
      convenienceFee,
      dataHash);

    if (transactionStatus == "True") {
      // update the cart
      let cart = await this.repo.findOne(payment.shoppingCart.id);

      cart.cartStatus = CartStatusEnum.Paid;

      let cartUpdate = await this.repo.save(cart);

    }
    return payment;

  }
}