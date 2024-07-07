// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/category/category_event.dart';
import 'package:ecommerce_store/bloc/category/category_state.dart';
import 'package:ecommerce_store/data/repository/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository ;
  CategoryBloc(
    this._repository,
  ) : super(CategoryInitState()) {
    on<CategoryRequestList>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
