import 'package:ecommerce_store/screens/home_screen.dart';
import 'package:ecommerce_store/widgets/banner_widget.dart';
import 'package:ecommerce_store/widgets/myBehavior.dart';
import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/category_horizontal_itemList.dart';
import 'widgets/product_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyBehavior(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}

class CategoryListViewBuilder extends StatelessWidget {
  const CategoryListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 44),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: CategoryHorizontalItemList(),
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
