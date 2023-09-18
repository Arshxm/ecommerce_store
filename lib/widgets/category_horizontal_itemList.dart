// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_store/widgets/cached_image.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_store/model/category.dart';

class CategoryHorizontalItemList extends StatelessWidget {
  final Category category;
  CategoryHorizontalItemList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryColor = "ff${category.color}";
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                  color: Color(hexColor),
                  blurRadius: 25,
                  spreadRadius: -12,
                  offset: const Offset(0.0, 9)),
            ],
            color: Color(hexColor),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
          ),
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CachedImage(
                imageUrl: category.icon!,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          category.title ?? 'Product',
          style: TextStyle(fontFamily: 'SB'),
        ),
      ],
    );
  }
}
