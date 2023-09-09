import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/util/api_exception.dart';



abstract class IBannerDatasource {
  Future<List<HomeBanner>> getBanners();
}

class BannerRemoteDatasource extends IBannerDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<HomeBanner>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<HomeBanner>((jsonObject) => HomeBanner.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, "unknown error");
    }
  }
  
  
}