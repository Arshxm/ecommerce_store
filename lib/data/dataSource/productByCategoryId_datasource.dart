import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IProductByCategoryIdDatasource {
  Future<List<Product>> getProductByCategoryId(String categoryId);
}

class ProductByCategoryIdDatasource extends IProductByCategoryIdDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProductByCategoryId(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'category="$categoryId"'};
      Response<dynamic> responses;

      if (categoryId == 'qnbj8d6b9lzzpn8') {
        responses = await _dio.get('collections/products/records');
      } else {
        responses = await _dio.get('collections/products/records',
            queryParameters: qParams);
      }
      return responses.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, "unknown error");
    }
  }
}
