import 'package:ecommerce_store/bloc/productById/productById_event.dart';
import 'package:ecommerce_store/bloc/productById/productById_state.dart';
import 'package:ecommerce_store/data/repository/productByCategoryId_repository.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByIdBloc extends Bloc<ProductByIdEvent, ProductByIdState> {
  final IProductByCategoryIdRepository _productByIdRepository = locator.get();

    ProductByIdBloc() : super(ProductByIdInitState()) {
    on<ProductByIdGetInitializedData>(((event, emit) async {
      emit(ProductByIdLoadingState());
      var productByIdResponse = await _productByIdRepository.getProductByCategoryId(event.categoryId);

      emit(ProductByIdResponseState(productByIdResponse));
    }));
  }
}
