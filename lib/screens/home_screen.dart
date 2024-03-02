import 'package:ecommerce_store/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_store/bloc/home/home_bloc.dart';
import 'package:ecommerce_store/bloc/home/home_event.dart';
import 'package:ecommerce_store/bloc/home/home_state.dart';
import 'package:ecommerce_store/model/banner.dart';
import 'package:ecommerce_store/model/category.dart';
import '../constants/colors.dart';
import '../widgets/banner_widget.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitializedData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _getSearchBox(),
              //Banner States
              if (state is HomeLoadingState) ...[
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator()),
                  ),
                )
              ],
              if (state is HomeResponseState) ...[
                state.response.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (r) {
                  return _getBanners(
                    list: r,
                  );
                })
              ],
              _getCategoryTitle(),
              //Category States
              if (state is HomeResponseState) ...[
                state.categoryList.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (categoryList) {
                  return _getCategoryList(categoryList: categoryList);
                })
              ],
              _getBestSellersTitle(),
              if (state is HomeRequestBestSellerState) ...[
                state.bestSellerProductList.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (r) {
                  return _getBestSellerProductsList(r);
                })
              ],
              _getMostViewedTitle(),
              if (state is HomeRequestHotestState) ...{
                state.hotestProductList.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (r) {
                  return _getMostViewedProductList(
                    productList: r,
                  );
                })
              },
            ],
          );
        }),
      ),
    );
  }
}

class _getMostViewedProductList extends StatelessWidget {
  List<Product> productList;
  _getMostViewedProductList({
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
                  productList: productList[index],
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

class _getMostViewedTitle extends StatelessWidget {
  const _getMostViewedTitle({
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

class _getCategoryList extends StatelessWidget {
  final List<Category> categoryList;
  _getCategoryList({
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

class _getBestSellerProductsList extends StatelessWidget {
  List<Product> bestSellerProductList;
  _getBestSellerProductsList(
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
                padding: EdgeInsets.only(left: 20),
                child: ProductItem(
                  productList: bestSellerProductList[index],
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

class _getCategoryTitle extends StatelessWidget {
  _getCategoryTitle({
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
  List<HomeBanner> list;
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

class _getSearchBox extends StatelessWidget {
  const _getSearchBox({
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
