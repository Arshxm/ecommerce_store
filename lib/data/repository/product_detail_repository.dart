import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/product_detail_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/model/product_variant.dart';
import 'package:ecommerce_store/model/property.dart';
import 'package:ecommerce_store/model/variant_type.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IDetailProductRepository{
    Future<Either<String, List<ProductImage>>> getProductImage(String productId); 
    Future<Either<String, List<VariantType>>> getVariantTypes(); 
    Future<Either<String, List<ProductVariant>>> getProductVariants(String productId); 
    Future<Either<String, Category>> getProductCategories(String categoryId); 
    Future<Either<String, Product>> getProductName(String productId); 
    Future<Either<String, List<Property>>> getProductProperty(String productId); 
}

class DetailProductRepository extends IDetailProductRepository {

  final IDetailProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage(String productId) async{
      try {
      var response = await _datasource.getGallery(productId);
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
  Future<Either<String, List<ProductVariant>>> getProductVariants(String productId) async{
   try {
      var response = await _datasource.getProductVariants(productId);
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }
  }
  
  @override
  Future<Either<String, Category>> getProductCategories(String categoryId) async {
    try {
      var response = await _datasource.getProductCategories(categoryId);
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }
  }
  
  @override
  Future<Either<String, Product>> getProductName(String productId) async {
   try {
      var response = await _datasource.getProductName(productId);
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }
  }
  
  @override
  Future<Either<String, List<Property>>> getProductProperty(String productId) async{
    try {
      var response = await _datasource.getProductProperties(productId);
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }
  }

}