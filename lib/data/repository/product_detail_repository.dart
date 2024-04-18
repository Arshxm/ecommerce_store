import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/product_detail_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/model/product_variant.dart';
import 'package:ecommerce_store/model/variant_type.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IDetailProductRepository{
    Future<Either<String, List<ProductImage>>> getProductImage(); 
    Future<Either<String, List<VariantType>>> getVariantTypes(); 
    Future<Either<String, List<ProductVariant>>> getProductVariants(); 
}

class DetailProductRepository extends IDetailProductRepository {

  final IDetailProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async{
      try {
      var response = await _datasource.getGallery();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }

  }
  
  @override
  Future<Either<String, List<VariantType>>> getVariantTypes()async{
    try {
      var response = await _datasource.getVariantTypes();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }
  }
  
  @override
  Future<Either<String, List<ProductVariant>>> getProductVariants() async{
   try {
      var response = await _datasource.getProductVariants();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }
  }

}