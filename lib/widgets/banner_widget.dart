// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/widgets/cached_image.dart';
import '../constants/colors.dart';
import 'category_horizontal_itemList.dart';

class BannerSlider extends StatelessWidget {
  final List<HomeBanner> bannerList;
  BannerSlider({super.key, required this.bannerList});

  final PageController controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 177,
          child: PageView.builder(
            controller: controller,
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: CachedImage(imageUrl: bannerList[index].thumbnail!,radius: 15,boxFit: BoxFit.fill,));
            }),
            itemCount: bannerList.length,
          ),
        ),
        Positioned(
          bottom: 5,
          child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                expansionFactor: 5,
                dotHeight: 6,
                dotWidth: 6,
                dotColor: Colors.white,
                activeDotColor: ConstColor.blue,
              ),
              controller: controller,
              count: 4),
        ),
      ],
    );
  }
}

class CategoryListViewBuilder extends StatelessWidget {
  final List<Category> categoryList;
  const CategoryListViewBuilder({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 44),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return 
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: CategoryHorizontalItemList(category: categoryList[index],),
          );
        },
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
