// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_store/model/cart_item.dart';

abstract class BasketState {}

class BasketInitState extends BasketState {}

class BasketLoadingState extends BasketState {}

class BasketResponseState extends BasketState {
  Either<String,List<BasketItem>> basketItemList;
  Either<String,int> totalPrice;
  BasketResponseState(
    this.basketItemList,
    this.totalPrice,
  );
}
