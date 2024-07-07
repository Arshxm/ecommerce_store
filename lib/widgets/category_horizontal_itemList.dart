// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_store/bloc/productById/productById_bloc.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/screens/productsByCategory_screen.dart';
import 'package:ecommerce_store/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_store/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => ProductByIdBloc(locator.get()),
                    child: ProductsByCategoryScreen(category: category),
                  ),
                ));
          },
          child: Container(
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
