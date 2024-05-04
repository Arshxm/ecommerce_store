// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProductByIdEvent {}

class ProductByIdGetInitializedData extends ProductByIdEvent {
  String categoryId;
  ProductByIdGetInitializedData(
    this.categoryId,
  );
  
}
