import 'package:dio/dio.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/model/product_variant.dart';
import 'package:ecommerce_store/model/variant.dart';
import 'package:ecommerce_store/model/variant_type.dart';
import 'package:ecommerce_store/util/api_exception.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallery();
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariants();
  Future<List<ProductVariant>> getProductVariants();
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
      var response = await _dio.get('collections/gallery/records',
          queryParameters: qParams);
      return response.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var response = await _dio.get(
        'collections/variants_type/records',
      );
      return response.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromjson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  }

  @override
  Future<List<Variant>> getVariants() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
      var response = await _dio.get(
        'collections/variants/records',
        queryParameters: qParams
      );
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromjson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex.toString());
      throw ApiException(0, "unknown error");
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariants();

    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variantListId = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();
      productVariantList.add(
          ProductVariant(variantType: variantType, variantList: variantList));
    }
    return productVariantList;
  }
}
