import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/home/home_event.dart';
import 'package:ecommerce_store/bloc/home/home_state.dart';
import 'package:ecommerce_store/data/repository/banner_repository.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';
import 'package:ecommerce_store/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _repository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitializedData>(((event, emit) async {
      emit(HomeLoadingState());
      var response = await _repository.getBanners();
      var categoryList = await _categoryRepository.getCategories();
      emit(HomeResponseState(response, categoryList));
    }));
  }
}
