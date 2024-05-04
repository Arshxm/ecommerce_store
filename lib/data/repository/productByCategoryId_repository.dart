// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/productByCategoryId_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/util/api_exception.dart';


abstract class IProductByCategoryIdRepository {
  Future<Either<String, List<Product>>> getProductByCategoryId(String categoryId);
}

class ProductByCategoryIdRepository extends IProductByCategoryIdRepository {

  
  IProductByCategoryIdDatasource _datasource = locator.get();
  
  @override
  Future<Either<String, List<Product>>> getProductByCategoryId(String categoryId) async {
    try {
      var response = await _datasource.getProductByCategoryId(categoryId);
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? "unknown Error");
    }
  }
}
