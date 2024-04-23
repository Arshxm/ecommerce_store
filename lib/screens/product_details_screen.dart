// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_store/bloc/product/product_bloc.dart';
import 'package:ecommerce_store/bloc/product/product_event.dart';
import 'package:ecommerce_store/bloc/product/product_state.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:ecommerce_store/data/repository/product_detail_repository.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/model/product_variant.dart';
import 'package:ecommerce_store/model/variant.dart';
import 'package:ecommerce_store/model/variant_type.dart';
import 'package:ecommerce_store/widgets/cached_image.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: CustomScrollView(
                slivers: [
                  if (state is ProductDetailLoadingState) ...{
                    const SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  },
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 44, right: 44, bottom: 20),
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
                            Image.asset('assets/images/icon_back.png'),
                            const Expanded(
                              child: Text(
                                "آیفون",
                                style: TextStyle(
                                    color: ConstColor.blue, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Image.asset('assets/images/icon_apple_blue.png'),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "آیفون 2022 Se",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  if (state is ProductDetailResponseState) ...{
                    state.productImages.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (response) {
                      return GalleryWidget(productImageList: response);
                    })
                  },
                  if (state is ProductDetailResponseState) ...{
                    state.productVariant.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (productVariantList) {
                        return VariantContainerGenerator(
                          productVariantList: productVariantList,
                        );
                      },
                    )
                  },
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 20,
                  //       right: 44,
                  //       left: 44,
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           "انتخاب حافظه داخلی",
                  //           style: TextStyle(fontSize: 12),
                  //         ),
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         Row(
                  //           children: [
                  //             Container(
                  //               width: 74,
                  //               height: 26,
                  //               child: const Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: 20, vertical: 5),
                  //                 child: Text(
                  //                   "128",
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(fontSize: 12),
                  //                 ),
                  //               ),
                  //               decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   borderRadius: const BorderRadius.all(
                  //                       Radius.circular(8)),
                  //                   border: Border.all(
                  //                       width: 1, color: ConstColor.grey)),
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             Container(
                  //               width: 74,
                  //               height: 26,
                  //               child: const Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: 20, vertical: 5),
                  //                 child: Text(
                  //                   "128",
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(fontSize: 12),
                  //                 ),
                  //               ),
                  //               decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   borderRadius: const BorderRadius.all(
                  //                       Radius.circular(8)),
                  //                   border: Border.all(
                  //                       width: 1, color: ConstColor.grey)),
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             Container(
                  //               width: 74,
                  //               height: 26,
                  //               child: const Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: 20, vertical: 5),
                  //                 child: Text(
                  //                   "128",
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(fontSize: 12),
                  //                 ),
                  //               ),
                  //               decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   borderRadius: const BorderRadius.all(
                  //                       Radius.circular(8)),
                  //                   border: Border.all(
                  //                       width: 1, color: ConstColor.grey)),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  //Technical details

                  SliverToBoxAdapter(
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "مشخصات فنی :",
                          ),
                          const Spacer(),
                          const Text(
                            "مشاهده",
                            style:
                                TextStyle(fontSize: 12, color: ConstColor.blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/images/icon_left_category.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      margin:
                          const EdgeInsets.only(left: 44, right: 44, top: 24),
                      height: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: ConstColor.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                    ),
                  ),

                  //About Product

                  SliverToBoxAdapter(
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "توضیحات محصول :",
                          ),
                          const Spacer(),
                          const Text(
                            "مشاهده",
                            style:
                                TextStyle(fontSize: 12, color: ConstColor.blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/images/icon_left_category.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      margin:
                          const EdgeInsets.only(left: 44, right: 44, top: 24),
                      height: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: ConstColor.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                    ),
                  ),

                  // Reviews

                  SliverToBoxAdapter(
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "نظرات کاربران :",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 26,
                                height: 26,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 45,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 60,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "+10",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "مشاهده",
                            style:
                                TextStyle(fontSize: 12, color: ConstColor.blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/images/icon_left_category.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      margin:
                          const EdgeInsets.only(left: 44, right: 44, top: 24),
                      height: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: ConstColor.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                    ),
                  ),

                  //Buttons and price

                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, right: 44, left: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [AddToBasketButton(), PriceTagButton()],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VariantContainerGenerator extends StatelessWidget {
  List<ProductVariant> productVariantList;
  VariantContainerGenerator({
    Key? key,
    required this.productVariantList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVariant in productVariantList) ...{
            if (productVariant.variantList.isNotEmpty) ...{
              VariantGeneratorChild(
                productVariant: productVariant,
              )
            }
          },
        ],
      ),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  ProductVariant productVariant;
  VariantGeneratorChild({super.key, required this.productVariant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 44,
        left: 44,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariant.variantType.title!,
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              if (productVariant.variantType.type == VariantTypeEnum.COLOR) ...{
                ColorVariantList(variantList: productVariant.variantList) ??
                    Text("null"),
              },
              if (productVariant.variantType.type ==
                  VariantTypeEnum.STORAGE) ...{
                StorageVariantList(
                    storageVariantList: productVariant.variantList),
              }
            ],
          )
        ],
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productImageList;

  GalleryWidget({
    Key? key,
    required this.productImageList,
  }) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Container(
          height: 264,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                              'assets/images/icon_favorite_deactive.png')
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                          height: double.infinity,
                          child: CachedImage(
                              imageUrl: widget
                                  .productImageList[selectedItem].imageUrl!)),
                      const Spacer(),
                      const Text('4.6', style: TextStyle(fontSize: 12)),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset('assets/images/icon_star.png'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(left: 20),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: ConstColor.grey,
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: CachedImage(
                                imageUrl:
                                    widget.productImageList[index].imageUrl!,
                                radius: 10,
                              )),
                        ),
                      );
                    },
                    itemCount: widget.productImageList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 60,
            width: 140,
            decoration: const BoxDecoration(
                color: ConstColor.blue,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () async {
                IDetailProductRepository repository = locator.get();
                var response = await repository.getProductImage();
                response.fold((l) {
                  print('Error $l');
                }, (r) {
                  r.forEach((element) {
                    print(element.imageUrl);
                  });
                });
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const SizedBox(
                    height: 53,
                    width: 160,
                    child: Center(
                        child: Text(
                      "افزودن سبد خربد",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,
          decoration: const BoxDecoration(
              color: ConstColor.green,
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: SizedBox(
                height: 53,
                width: 160,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 30,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ConstColor.red,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 6),
                                child: Text(
                                  '3%',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "49,800,000",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                            ),
                          ),
                          Text(
                            "48,800,000",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "تومان",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

List<Widget> _buildColorVariantsOption(List<Variant> variantList) {
  List<Widget> colorWidgets = [];
  for (var colorVariant in variantList) {
    String variantColor = "ff${colorVariant.value}";
    int hexColor = int.parse(variantColor, radix: 16);
    var item = Container(
      margin: const EdgeInsets.only(left: 10),
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: Color(hexColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
    colorWidgets.add(item);
  }

  return colorWidgets;
}

class ColorVariantList extends StatefulWidget {
  List<Variant> variantList;
  ColorVariantList({super.key, required this.variantList});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 30,
        width: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.variantList.length,
          itemBuilder: ((context, index) {
            String variantColor = "ff${widget.variantList[index].value}";
            int hexColor = int.parse(variantColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(left: 10),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: (_selectedIndex == index)
                      ? Border.all(
                          width: 2,
                          color: ConstColor.blue,
                          strokeAlign: BorderSide.strokeAlignOutside)
                      : Border.all(width: 2, color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Color(hexColor),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            );
            ;
          }),
        ),
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  List<Variant> storageVariantList;
  StorageVariantList({
    Key? key,
    required this.storageVariantList,
  }) : super(key: key);

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        width: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.storageVariantList.length ?? 2,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                width: 74,
                height: 26,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    widget.storageVariantList[index].value! ?? "128",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: (_selectedIndex == index)
                      ? Border.all(width: 2, color: ConstColor.blue)
                      : Border.all(width: 1, color: ConstColor.grey),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
