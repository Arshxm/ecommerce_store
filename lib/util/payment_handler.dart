import 'package:ecommerce_store/util/extensions/String_Extensions.dart';
import 'package:ecommerce_store/util/url_handler.dart';
import 'package:uni_links2/uni_links.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initPaymentRequest();
  Future<void> sendPaymentRequest();
  Future<void> verifyPaymentRequest();
}

class ZarinpalPaymentHandler extends PaymentHandler {
  final PaymentRequest _paymentRequest ;
  UrlHandler urlHandler ;
  String? _authority;
  String? _status;
  ZarinpalPaymentHandler(this._paymentRequest, this.urlHandler);
  @override
  Future<void> initPaymentRequest() async {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(1000);
    _paymentRequest.setMerchantID('test');
    _paymentRequest.setDescription("this is a test for apple shop application");
    _paymentRequest.setCallbackURL('expertflutter://shop');

    linkStream.listen((deepLink) {
      if (deepLink!.toLowerCase().contains("authority")) {
        //extracting status and authority from url
        _authority = deepLink.extractValueFromQuery("Authority");
        _status = deepLink.extractValueFromQuery("Status");
        verifyPaymentRequest();
      }
    });
  }

  @override
  Future<void> sendPaymentRequest() async {
    ZarinPal().startPayment(
      _paymentRequest,
      (status, paymentGatewayUri) {
        if (status == 100) {
          urlHandler.openUrl(paymentGatewayUri!);

          //this isn't where a url should be launched

          //launchUrl(Uri.parse(paymentGatewayUri!),
          //    mode: LaunchMode.externalApplication);
        }
      },
    );
  }

  @override
  Future<void> verifyPaymentRequest() async {
    //verification Payment method for zarinpal and debugging it and returning ref id
    ZarinPal().verificationPayment(_status!, _authority!, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      if (isPaymentSuccess) {
        //print(refID);
      } else {
        //print("error");
      }
    });
  }
}
