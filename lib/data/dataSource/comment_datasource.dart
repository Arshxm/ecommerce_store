import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/comment.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class ICommentDatasource {
  Future<List<Comment>> getComments(String productId);
}

class CommentRemoteDatasource extends ICommentDatasource {
  final Dio _dio = locator.get();
  
  @override
  Future<List<Comment>> getComments(String productId) async{

    Map<String, String> qParams = {'filter': 'product_id="$productId"'};

    try {
      var response = await _dio.get('collections/comment/records', queryParameters: qParams);
      return response.data['items']
          .map<Comment>((jsonObject) => Comment.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, "unknown error");
    }
  }


}
