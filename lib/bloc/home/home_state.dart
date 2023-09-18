import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/model/category.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<HomeBanner>> response;
  Either<String, List<Category>> categoryList;
  HomeResponseState(this.response, this.categoryList);
}
