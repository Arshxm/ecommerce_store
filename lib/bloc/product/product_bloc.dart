import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/product/product_event.dart';
import 'package:ecommerce_store/bloc/product/product_state.dart';
import 'package:ecommerce_store/data/repository/basket_repository.dart';
import 'package:ecommerce_store/data/repository/product_detail_repository.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/cart_item.dart';
import 'package:ecommerce_store/model/product.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitState()) {

    final IDetailProductRepository _productRepository= locator.get();
    final IBasketRepository _basketRepository= locator.get();

    on<ProductInitializeEvent>((event, emit) async {

        emit(ProductDetailLoadingState());

        var productImages = await _productRepository.getProductImage(event.productId);
        var productVariant = await _productRepository.getProductVariants(event.productId);
        var productCategory = await _productRepository.getProductCategories(event.categoryId);
        var productName = await _productRepository.getProductName(event.productId);
        var productProperty = await _productRepository.getProductProperty(event.productId);

        emit(ProductDetailResponseState(productImages,productVariant, productCategory, productName,productProperty));
    });

    on<ProductAddToBasket>(((event, emit) {
      Product product = event.product;
      var item = BasketItem(
          product.id,
          product.collectionId,
          product.thumbnail,
          product.discountPrice,
          product.price,
          product.name,
          product.categoryId,
        );

        _basketRepository.addProductToBasket(item);
    }),);
  }
}
