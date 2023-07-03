import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/category_horizontal_itemList.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: ConstColor.backgroundScreenColor,
          body: Center(
              child: Container(
            height: 216,
            width: 160,
          )),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
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
