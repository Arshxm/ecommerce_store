// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class Property {
  String? collectionId;
  String? id;
  String? productId;
  String? title;
  String? value;
  Property({
    this.collectionId,
    this.id,
    this.productId,
    this.title,
    this.value,
  });

  factory Property.fromMapJson(Map<String, dynamic> jsonObject) {
    return Property(
      collectionId: jsonObject['collectionId'],
      id: jsonObject['id'],
      productId: jsonObject['product_id'],
      title: jsonObject['title'],
      value: jsonObject['value'],
     ); 
  }
}
