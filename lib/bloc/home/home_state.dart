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
  HomeResponseState(this.response, this.categoryList, this.productList);
}

class HomeRequestHotestState extends HomeState{
    Either<String, List<Product>> hotestProductList;
  HomeRequestHotestState(this.hotestProductList);
}
class HomeRequestBestSellerState extends HomeState{
    Either<String, List<Product>> bestSellerProductList;
  HomeRequestBestSellerState(this.bestSellerProductList);
}

