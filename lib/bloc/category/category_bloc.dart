import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/category/category_event.dart';
import 'package:ecommerce_store/bloc/category/category_state.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';
import 'package:ecommerce_store/di/di.dart';




class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator.get();
  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryRequestList>((event, emit) async{
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
