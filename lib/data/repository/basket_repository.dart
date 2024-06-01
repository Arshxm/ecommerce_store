import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/basket_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/cart_item.dart';
import 'package:ecommerce_store/util/api_exception.dart';


abstract class IBasketRepository {
  Future<Either<String,String>> addProductToBasket(BasketItem basketItem);
  Future<Either<String,List<BasketItem>>> getAllBasketItems();
  Future<Either<String,int>> getBasketFinalPrice();
 }

class BasketRepository extends IBasketRepository {

  IBasketDataSource _dataSource = locator.get();

  @override
  Future<Either<String, String>> addProductToBasket(basketItem) async {
    try {
      _dataSource.addProduct(basketItem);
      return right("Data Has been added to Cart");
    } catch(e) {
      return left("Error!");
    }
  }
  
  @override
  Future<Either<String, List<BasketItem>>> getAllBasketItems() async {
    try {
      var basketItemList = await _dataSource.getAllBasketItems();
      return right(basketItemList);
    } catch (e) {
      return left("Error, can't show basket Items!");
    }
  }
  
  @override
  Future<Either<String, int>> getBasketFinalPrice() async {
    try {
      var totalPrice = await _dataSource.getBasketFinalPrice();
      return right(totalPrice);
    } catch (e) {
      return left("Error, can't show anything!");
    }
  }

  
}