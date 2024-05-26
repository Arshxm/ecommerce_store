import 'dart:ffi';

import 'package:ecommerce_store/model/cart_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IBasketDataSource {
  Future<void> addProduct(BasketItem basketItem);
  Future<List<BasketItem>> getAllBasketItems();
}

class BasketLocalDatasource extends IBasketDataSource {
  var box = Hive.box<BasketItem>('CartBox');

  @override
  Future<void> addProduct(BasketItem basketItem) async {
    box.add(basketItem);
  }

  @override
  Future<List<BasketItem>> getAllBasketItems() async {
    return box.values.toList();
  }
}
