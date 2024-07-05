import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/basket/basket_event.dart';
import 'package:ecommerce_store/bloc/basket/basket_state.dart';
import 'package:ecommerce_store/data/repository/basket_repository.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/util/extensions/String_Extensions.dart';
import 'package:uni_links2/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  IBasketRepository _basketRepository = locator.get();
  PaymentRequest _paymentRequest = PaymentRequest();

  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(
      (event, emit) async {
        var _basketItemList = await _basketRepository.getAllBasketItems();
        var _basketTotalPrice = await _basketRepository.getBasketFinalPrice();
        emit(BasketResponseState(_basketItemList, _basketTotalPrice));
      },
    );

    on<BasketPaymentInitEvent>((event, emit) async {
      _paymentRequest.setIsSandBox(true);
      _paymentRequest.setAmount(1000);
      _paymentRequest.setMerchantID('test');
      _paymentRequest
          .setDescription("this is a test for apple shop application");
      _paymentRequest.setCallbackURL('expertflutter://shop');

      //verification

      linkStream.listen((deepLink) {
        if (deepLink!.toLowerCase().contains("authority")) {
          //extracting status and authority from url
          String? authority = deepLink.extractValueFromQuery("Authority");
          String? status = deepLink.extractValueFromQuery("Status");
          //verification Payment method for zarinpal and debugging it and returning ref id
          ZarinPal().verificationPayment(status!, authority!, _paymentRequest,
              (isPaymentSuccess, refID, paymentRequest) {
            if (isPaymentSuccess) {
              print(refID);
            } else {
              print("error");
            }
          });
        }
      });
    });

    on<BasketPaymentRequestEvent>((event, emit) async {
      ZarinPal().startPayment(
        _paymentRequest,
        (status, paymentGatewayUri) {
          if (status == 100) {
            launchUrl(Uri.parse(paymentGatewayUri!),
                mode: LaunchMode.externalApplication);
          }
        },
      );
    });
  }
}
