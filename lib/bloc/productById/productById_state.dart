import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/model/product.dart';

abstract class ProductByIdState {}

class ProductByIdInitState extends ProductByIdState {}

class ProductByIdLoadingState extends ProductByIdState {}

class ProductByIdResponseState extends ProductByIdState {
  Either<String, List<Product>> productList;

  ProductByIdResponseState(this.productList);
}
