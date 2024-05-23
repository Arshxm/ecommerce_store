// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_store/model/product.dart';

abstract class ProductEvent {}

class ProductInitializeEvent extends ProductEvent {
  String productId;
  String categoryId;
  ProductInitializeEvent({
    required this.productId,
    required this.categoryId,
  });
}

class ProductAddToBasket extends ProductEvent{
  Product product;
  ProductAddToBasket(
    this.product,
  );
}
