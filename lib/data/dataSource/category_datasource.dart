import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class ICategoryDatasource {
  Future<List<Category>> getCategories();
}

class CategoryRemoteDatasource extends ICategoryDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Category>> getCategories() async {
    try {
      var response = await _dio.get('collections/category/records');
      return response.data['items']
          .map<Category>((jsonObject) => Category.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, "unknown error");
    }
  }
}
