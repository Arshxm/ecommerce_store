import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/comment_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/comment.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class ICommentRepository {
  Future<Either<String, List<Comment>>> getComments(String productId);
}

class CommentRepository extends ICommentRepository {
  final ICommentDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<Comment>>> getComments(String prodcutId) async{
    try {
      var response = await _datasource.getComments(prodcutId);
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }


  }
}