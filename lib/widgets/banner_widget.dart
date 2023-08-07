import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants/colors.dart';
import 'category_horizontal_itemList.dart';


class BannerSlider extends StatelessWidget {
  BannerSlider({super.key,});

  final PageController controller = PageController(viewportFraction: 0.8);

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
                  decoration: const BoxDecoration(color: Colors.redAccent),
                ),
              );
            }),
            itemCount: 3,
          ),
        ),
        Positioned(
          bottom: 5,
          child: SmoothPageIndicator(
              effect:  const ExpandingDotsEffect(
                expansionFactor: 5,
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.white,
                activeDotColor: ConstColor.blue,
              ),
              controller: controller,
              count: 3),
        ),
      ],
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