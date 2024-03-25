import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/product_detail_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IDetailProductRepository{
    Future<Either<String, List<ProductImage>>> getProductImage(); 
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

}