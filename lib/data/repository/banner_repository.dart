import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/banner_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<HomeBanner>>> getBanners();
}

class BannerRepository extends IBannerRepository {

  final IBannerDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<HomeBanner>>> getBanners() async{
    try {
      var response = await _datasource.getBanners();
      return right(response);
    } on ApiException catch(e) {
      return left(e.message ?? "unknown Error");
    }


  }
}