import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/home/home_event.dart';
import 'package:ecommerce_store/bloc/home/home_state.dart';
import 'package:ecommerce_store/data/repository/banner_repository.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';
import 'package:ecommerce_store/data/repository/product_repository.dart';
import 'package:ecommerce_store/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _repository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  final IProductRepository _productRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitializedData>(((event, emit) async {
      emit(HomeLoadingState());
      var response = await _repository.getBanners();
      var categoryList = await _categoryRepository.getCategories();
      var productList = await _productRepository.getProducts();
      emit(HomeResponseState(response, categoryList, productList));

      var hotestProductList = await _productRepository.getHottest();
      emit(HomeRequestHotestState(hotestProductList)); 

      var bestSellerProductList = await _productRepository.getBestSeller();
      emit(HomeRequestBestSellerState(bestSellerProductList)); 
    }));
  }
}
