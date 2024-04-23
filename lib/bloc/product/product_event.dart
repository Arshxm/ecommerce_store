// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProductEvent{

}

class ProductInitializeEvent extends ProductEvent {
  String productId;
  ProductInitializeEvent({
    required this.productId,
  });

}
