import 'package:dartz/dartz_unsafe.dart';
import 'package:ecommerce_store/data/repository/banner_repository.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/banner_widget.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: ElevatedButton(
                    onPressed: () async {
                      var response = await BannerRepository().getBanners();
                      response.fold((l) {
                        print(l);
                      }, (r) {
                        r.forEach((element) {
                          print(element.id);
                        });
                      });
                    },
                    child: Text("click")),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 44, right: 44, bottom: 32),
                  child: Container(
                    height: 46,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset('assets/images/icon_apple_blue.png'),
                        const SizedBox(
                          width: 16,
                        ),
                        const Expanded(
                          child: Text(
                            "Searching for...",
                            style: TextStyle(
                                color: ConstColor.grey,
                                fontFamily: 'RB',
                                fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset('assets/images/icon_search.png'),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: BannerSlider(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 12,
                            color: ConstColor.grey,
                            fontFamily: "RB"),
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100, child: CategoryListViewBuilder()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 44, right: 44, bottom: 20, top: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icon_left_category.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Show All",
                        style:
                            TextStyle(color: ConstColor.blue, fontFamily: "RB"),
                      ),
                      const Spacer(),
                      const Text(
                        "Best Sellers",
                        style: TextStyle(
                            fontSize: 12,
                            color: ConstColor.grey,
                            fontFamily: "RB"),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: ProductItem(),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 44, right: 44, bottom: 20, top: 32),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icon_left_category.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Show All",
                        style:
                            TextStyle(color: ConstColor.blue, fontFamily: "RB"),
                      ),
                      const Spacer(),
                      const Text(
                        "Most Viewed",
                        style: TextStyle(
                            fontSize: 12,
                            color: ConstColor.grey,
                            fontFamily: "RB"),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: ProductItem(),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
