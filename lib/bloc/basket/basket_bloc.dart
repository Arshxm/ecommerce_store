// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:ecommerce_store/bloc/basket/basket_event.dart';
import 'package:ecommerce_store/bloc/basket/basket_state.dart';
import 'package:ecommerce_store/data/repository/basket_repository.dart';
import 'package:ecommerce_store/util/payment_handler.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository ;
  final PaymentHandler _paymentHandler ;

  BasketBloc(
    this._paymentHandler,
    this._basketRepository 
  ) : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(
      (event, emit) async {
        var _basketItemList = await _basketRepository.getAllBasketItems();
        var _basketTotalPrice = await _basketRepository.getBasketFinalPrice();
        emit(BasketResponseState(_basketItemList, _basketTotalPrice));
      },
    );

    on<BasketPaymentInitEvent>((event, emit) async {
      _paymentHandler.initPaymentRequest();
    });

    on<BasketPaymentRequestEvent>((event, emit) async {
      _paymentHandler.sendPaymentRequest();
    });
  }
}
