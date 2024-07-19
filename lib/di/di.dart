import 'package:dio/dio.dart';
import 'package:ecommerce_store/bloc/basket/basket_bloc.dart';
import 'package:ecommerce_store/data/dataSource/authentication_datasource.dart';
import 'package:ecommerce_store/data/dataSource/banner_datasource.dart';
import 'package:ecommerce_store/data/dataSource/basket_datasource.dart';
import 'package:ecommerce_store/data/dataSource/category_datasource.dart';
import 'package:ecommerce_store/data/dataSource/comment_datasource.dart';
import 'package:ecommerce_store/data/dataSource/productByCategoryId_datasource.dart';
import 'package:ecommerce_store/data/dataSource/product_datasource.dart';
import 'package:ecommerce_store/data/dataSource/product_detail_datasource.dart';
import 'package:ecommerce_store/data/repository/authentication_repository.dart';
import 'package:ecommerce_store/data/repository/banner_repository.dart';
import 'package:ecommerce_store/data/repository/basket_repository.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';
import 'package:ecommerce_store/data/repository/comment_repository.dart';
import 'package:ecommerce_store/data/repository/productByCategoryId_repository.dart';
import 'package:ecommerce_store/data/repository/product_detail_repository.dart';
import 'package:ecommerce_store/data/repository/product_repository.dart';
import 'package:ecommerce_store/util/payment_handler.dart';
import 'package:ecommerce_store/util/url_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //Util
  locator.registerSingleton<UrlHandler>(UrlLauncher());
  
  locator
      .registerSingleton<PaymentHandler>(ZarinpalPaymentHandler(locator.get()));

  //components

  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //Data Sources

  locator
      .registerFactory<IAuthenticationDataSource>(() => AuthenticationRemote());

  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());

  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());

  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());

  locator.registerFactory<IDetailProductDatasource>(
      () => DetailProductRemoteDatasource());

  locator.registerFactory<IProductByCategoryIdDatasource>(
      () => ProductByCategoryIdRemoteDatasource());

  locator.registerFactory<IBasketDataSource>(() => BasketLocalDatasource());

  locator.registerFactory<ICommentDatasource>(() => CommentRemoteDatasource());

  //Repositories

  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());

  locator.registerFactory<IBannerRepository>(() => BannerRepository());

  locator.registerFactory<IProductRepository>(() => ProductRepository());

  locator.registerFactory<IDetailProductRepository>(
      () => DetailProductRepository());

  locator.registerFactory<IProductByCategoryIdRepository>(
      () => ProductByCategoryIdRepository());

  locator.registerFactory<IBasketRepository>(() => BasketRepository());

  locator.registerFactory<ICommentRepository>(() => CommentRepository());

  //BLoC

  locator
      .registerSingleton<BasketBloc>(BasketBloc(locator.get(), locator.get()));
}
