export class ShoppingCartUpdateResponseDto{
    isSuccess: boolean;
    message: string;
    totalItems: number;
    totalPrice: number;
    cartItemList: any[];
}