import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/model/product_variant.dart';
import 'package:ecommerce_store/model/variant_type.dart';

abstract class ProductState{

}

class ProductInitState extends ProductState{
   
}

class ProductDetailLoadingState extends ProductState{

}

class ProductDetailResponseState extends ProductState{

    Either<String,List<ProductImage>> productImages;
    Either<String,List<ProductVariant>> productVariant;

    ProductDetailResponseState(this.productImages, this.productVariant);
}