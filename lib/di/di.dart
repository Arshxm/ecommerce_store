import 'package:dio/dio.dart';
import 'package:ecommerce_store/data/dataSource/authentication_datasource.dart';
import 'package:ecommerce_store/data/dataSource/banner_datasource.dart';
import 'package:ecommerce_store/data/dataSource/category_datasource.dart';
import 'package:ecommerce_store/data/dataSource/product_datasource.dart';
import 'package:ecommerce_store/data/dataSource/product_detail_datasource.dart';
import 'package:ecommerce_store/data/repository/authentication_repository.dart';
import 'package:ecommerce_store/data/repository/banner_repository.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';
import 'package:ecommerce_store/data/repository/product_detail_repository.dart';
import 'package:ecommerce_store/data/repository/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async{





  //components

  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );


  locator.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  //Data Sources

  locator.registerFactory<IAuthenticationDataSource>(() => AuthenticationRemote()); 

  locator.registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());

  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());

  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());

  locator.registerFactory<IDetailProductDatasource>(() => DetailProductRemoteDatasource());



  //Repositories 

  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());

  locator.registerFactory<IBannerRepository>(() => BannerRepository()); 

  locator.registerFactory<IProductRepository>(() => ProductRepository()); 

  locator.registerFactory<IDetailProductRepository>(() => DetailProductRepository()); 
}
