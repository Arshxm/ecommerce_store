import 'package:ecommerce_store/bloc/home/home_event.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_store/bloc/home/home_bloc.dart';
import 'package:ecommerce_store/bloc/home/home_state.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return _getHomeScreenContent(context, state);
        }),
      ),
    );
  }
}

Widget _getHomeScreenContent(BuildContext context, HomeState state) {
  if (state is HomeLoadingState) {
    return Center(
      child: LoadingAnimationWidget.flickr(
          leftDotColor: ConstColor.blue,
          rightDotColor: ConstColor.red,
          size: 50),
    );
  } else if (state is HomeResponseState) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(HomeGetInitializedData());
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //Banner States

          const _GetSearchBox(),

          state.response.fold((l) {
            return SliverToBoxAdapter(
              child: Text(l),
            );
          }, (r) {
            return _getBanners(
              list: r,
            );
          }),

          const _GetCategoryTitle(),
          //Category States

          state.categoryList.fold((l) {
            return SliverToBoxAdapter(
              child: Text(l),
            );
          }, (categoryList) {
            return _GetCategoryList(categoryList: categoryList);
          }),

          const _getBestSellersTitle(),

          state.bestSellerProductList.fold((l) {
            return SliverToBoxAdapter(
              child: Text(l),
            );
          }, (r) {
            return _GetBestSellerProductsList(r);
          }),

          const _GetMostViewedTitle(),

          state.hotestProductList.fold((l) {
            return SliverToBoxAdapter(
              child: Text(l),
            );
          }, (r) {
            return _GetMostViewedProductList(
              productList: r,
            );
          })
        ],
      ),
    );
  } else {
    return const Text("salam");
  }
}

class _GetMostViewedProductList extends StatelessWidget {
  final List<Product> productList;
  const _GetMostViewedProductList({
    required this.productList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 230,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ProductItem(
                  product: productList[index],
                ),
              );
            },
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class _GetMostViewedTitle extends StatelessWidget {
  const _GetMostViewedTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
        child: Row(
          children: [
            const Text(
              "پربازدید ترین ها",
              style: TextStyle(
                  fontSize: 12, color: ConstColor.grey, fontFamily: "SB"),
            ),
            const Spacer(),
            const Text(
              "مشاهده همه",
              style: TextStyle(color: ConstColor.blue, fontFamily: "SB"),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/icon_left_category.png'),
          ],
        ),
      ),
    );
  }
}

class _GetCategoryList extends StatelessWidget {
  final List<Category> categoryList;
  const _GetCategoryList({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: CategoryListViewBuilder(
          categoryList: categoryList,
        ),
      ),
    );
  }
}

class _GetBestSellerProductsList extends StatelessWidget {
  final List<Product> bestSellerProductList;
  const _GetBestSellerProductsList(
    this.bestSellerProductList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 230,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ProductItem(
                  product: bestSellerProductList[index],
                ),
              );
            },
            itemCount: bestSellerProductList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class _getBestSellersTitle extends StatelessWidget {
  const _getBestSellersTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 20),
        child: Row(
          children: [
            const Text(
              "پر فروش ترین ها",
              style: TextStyle(
                  fontSize: 12, color: ConstColor.grey, fontFamily: "SB"),
            ),
            const Spacer(),
            const Text(
              "مشاهده همه",
              style: TextStyle(color: ConstColor.blue, fontFamily: "SB"),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/icon_left_category.png'),
          ],
        ),
      ),
    );
  }
}

class _GetCategoryTitle extends StatelessWidget {
  const _GetCategoryTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "دسته بندی",
              style: TextStyle(
                  fontSize: 12, color: ConstColor.grey, fontFamily: "SB"),
            )
          ],
        ),
      ),
    );
  }
}

class _getBanners extends StatelessWidget {
  final List<HomeBanner> list;
  _getBanners({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(
        bannerList: list,
      ),
    );
  }
}

class _GetSearchBox extends StatelessWidget {
  const _GetSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, bottom: 32),
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
              Image.asset('assets/images/icon_search.png'),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                child: Text(
                  "جستجوی محصولات",
                  style: TextStyle(
                      color: ConstColor.grey, fontFamily: 'SB', fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Image.asset('assets/images/icon_apple_blue.png'),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
