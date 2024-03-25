import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IDetailProductDatasource{
    Future<List<ProductImage>> getGallery();
} 

class DetailProductRemoteDatasource extends IDetailProductDatasource{

  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="78n4wqor3hhnkju"'};
      var response = await _dio.get('collections/gallery/records',queryParameters: qParams);
      return response.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  
  }

}