import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/model/product.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<HomeBanner>> response;
  Either<String, List<Category>> categoryList;
  Either<String, List<Product>> productList;
  Either<String, List<Product>> hotestProductList;
  Either<String, List<Product>> bestSellerProductList;
  HomeResponseState(
      this.response,
      this.categoryList,
      this.productList,
      this.bestSellerProductList,
      this.hotestProductList);
}
