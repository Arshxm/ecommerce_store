import 'package:ecommerce_store/constants/colors.dart';
import 'package:ecommerce_store/widgets/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: BannerSlider(controller: controller),
        ),
      ),
    );
  }
}


