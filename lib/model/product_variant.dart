// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_store/model/variant.dart';
import 'package:ecommerce_store/model/variant_type.dart';

class ProductVariant {
  VariantType variantType;
  List<Variant> variantList;
  ProductVariant({
    required this.variantType,
    required this.variantList,
  });
  }
 