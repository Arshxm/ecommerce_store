import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/product_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, List<Product>>> getHottest();
  Future<Either<String, List<Product>>> getBestSeller();
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<Product>>> getProducts() async{
    try {
      var response = await _datasource.getProducts();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }


  }
  
  @override
  Future<Either<String, List<Product>>> getBestSeller() async {
        try {
      var response = await _datasource.getBestSeller();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }

  }
  
  @override
  Future<Either<String, List<Product>>> getHottest() async{
       try {
      var response = await _datasource.getHottest();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }

  }
}