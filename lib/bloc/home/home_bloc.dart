import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/home/home_event.dart';
import 'package:ecommerce_store/bloc/home/home_state.dart';
import 'package:ecommerce_store/data/repository/banner_repository.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';
import 'package:ecommerce_store/data/repository/product_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository;
  final ICategoryRepository _categoryRepository;
  final IProductRepository _productRepository;
  HomeBloc(
      this._bannerRepository, this._categoryRepository, this._productRepository)
      : super(HomeInitState()) {
    on<HomeGetInitializedData>(((event, emit) async {
      emit(HomeLoadingState());
      var response = await _bannerRepository.getBanners();
      var categoryList = await _categoryRepository.getCategories();
      var productList = await _productRepository.getProducts();
      var hotestProductList = await _productRepository.getHottest();
      var bestSellerProductList = await _productRepository.getBestSeller();
      emit(HomeResponseState(response, categoryList, productList,
          hotestProductList, bestSellerProductList));
    }));
  }
}
