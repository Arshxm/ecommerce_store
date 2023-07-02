import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';


class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemBuilder: ((context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(color: Colors.redAccent),
                ),
              );
            }),
            itemCount: 3,
          ),
        ),
        Positioned(
          bottom: 5,
          child: SmoothPageIndicator(
              effect:  ExpandingDotsEffect(
                expansionFactor: 5,
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.white,
                activeDotColor: ConstColor.blueIndicator,
              ),
              controller: controller,
              count: 3),
        ),
      ],
    );
  }
}