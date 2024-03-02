import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getHottest();
  Future<List<Product>> getBestSeller();
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> getProducts() async {
    try {
      var response = await _dio.get('collections/products/records');
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  }
  
  @override
  Future<List<Product>> getBestSeller() async {
    try {
      Map<String, String> qParams = {
        'filter':'popularity = "Best Seller"'
      };
      var response = await _dio.get('collections/products/records', queryParameters: qParams);
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  }
  
  @override
  Future<List<Product>> getHottest() async {
    try {
      Map<String, String> qParams = {
        'filter':'popularity = "Hotest"'
      };
      var response = await _dio.get('collections/products/records', queryParameters: qParams);
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  }
}
