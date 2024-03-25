import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/model/product_image.dart';

abstract class ProductState{

}

class ProductInitState extends ProductState{
   
}

class ProductDetailLoadingState extends ProductState{

}

class ProductDetailResponseState extends ProductState{

    Either<String,List<ProductImage>> getProductImage;

    ProductDetailResponseState(this.getProductImage);
}