import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/category_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<Category>>> getCategories() async{
    try {
      var response = await _datasource.getCategories();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }


  }
}
