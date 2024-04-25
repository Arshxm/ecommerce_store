import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/product/product_event.dart';
import 'package:ecommerce_store/bloc/product/product_state.dart';
import 'package:ecommerce_store/data/repository/product_detail_repository.dart';
import 'package:ecommerce_store/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitState()) {

    final IDetailProductRepository _productRepository= locator.get();

    on<ProductInitializeEvent>((event, emit) async {

        emit(ProductDetailLoadingState());

        var productImages = await _productRepository.getProductImage(event.productId);
        var productVariant = await _productRepository.getProductVariants();
        var productCategory = await _productRepository.getProductCategories(event.categoryId);
        emit(ProductDetailResponseState(productImages,productVariant, productCategory));
    });
  }
}
