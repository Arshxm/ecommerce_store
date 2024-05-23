import 'package:ecommerce_store/model/cart_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IBasketDataSource{
  Future<void> addProduct(BasketItem basketItem);
}

class BasketLocalDatasource extends IBasketDataSource {
  @override
  Future<void> addProduct(BasketItem basketItem) async {
        var box = Hive.box<BasketItem>('CartBox');
        box.add(
          basketItem
        );
  }
  
}