import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/basket/basket_event.dart';
import 'package:ecommerce_store/bloc/basket/basket_state.dart';
import 'package:ecommerce_store/data/repository/basket_repository.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/util/payment_handler.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  IBasketRepository _basketRepository = locator.get();
  PaymentHandler paymentHandler = ZarinpalPaymentHandler();

  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(
      (event, emit) async {
        var _basketItemList = await _basketRepository.getAllBasketItems();
        var _basketTotalPrice = await _basketRepository.getBasketFinalPrice();
        emit(BasketResponseState(_basketItemList, _basketTotalPrice));
      },
    );

    on<BasketPaymentInitEvent>((event, emit) async {
      paymentHandler.initPaymentRequest();
    });

    on<BasketPaymentRequestEvent>((event, emit) async {
      paymentHandler.sendPaymentRequest();
    });
  }
}
