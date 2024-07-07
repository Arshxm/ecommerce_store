// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:ecommerce_store/bloc/basket/basket_bloc.dart';
import 'package:ecommerce_store/bloc/basket/basket_event.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_store/bloc/product/product_bloc.dart';
import 'package:ecommerce_store/bloc/product/product_event.dart';
import 'package:ecommerce_store/bloc/product/product_state.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/model/product_image.dart';
import 'package:ecommerce_store/model/product_variant.dart';
import 'package:ecommerce_store/model/property.dart';
import 'package:ecommerce_store/model/variant.dart';
import 'package:ecommerce_store/model/variant_type.dart';
import 'package:ecommerce_store/widgets/cached_image.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  final Property? property;
  const ProductDetailsScreen({
    Key? key,
    required this.product,
    this.property,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc(locator.get(), locator.get());
        bloc.add(
          ProductInitializeEvent(
            productId: widget.product.id,
            categoryId: widget.product.categoryId,
          ),
        );
        return bloc;
      },
      child: DetailContentWidget(parentWidget: widget),
    );
  }
}

class DetailContentWidget extends StatelessWidget {
  const DetailContentWidget({
    super.key,
    required this.parentWidget,
  });

  final ProductDetailsScreen parentWidget;

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

                  //TODO Category Name of each item

                  if (state is ProductDetailResponseState) ...{
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
                              Expanded(
                                  child: state.productCategory.fold(
                                (l) {
                                  return const Text(
                                    "error text",
                                    style: TextStyle(
                                        color: ConstColor.blue, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  );
                                },
                                (productCategory) {
                                  return Text(
                                    "${productCategory.title}",
                                    style: const TextStyle(
                                        color: ConstColor.blue, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  );
                                },
                              )),
                              Image.asset('assets/images/icon_apple_blue.png'),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  },

                  //TODO Name of each item

                  if (state is ProductDetailResponseState) ...{
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          state.productName.fold((l) {
                            return "Nothing to show";
                          }, (product) {
                            return product.name;
                          }),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  },
                  if (state is ProductDetailResponseState) ...{
                    state.productImages.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (response) {
                      return GalleryWidget(
                          defaultProductThumbnail:
                              parentWidget.product.thumbnail,
                          productImageList: response);
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

                  //TODO Storage Boxes

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

                  //TODO Technical details
                  if (state is ProductDetailResponseState) ...{
                    state.productProperty.fold((l) {
                      return const SliverToBoxAdapter(
                        child: Text("coudn't load anything it is empty"),
                      );
                    }, (response) {
                      return ProductProperties(propertyList: response);
                    })
                  },

                  //TODO About Product

                  ProductDescription(
                    productDescription: parentWidget.product.description,
                  ),

                  //TODO Reviews

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

                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 44, left: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddToBasketButton(product: parentWidget.product),
                          const PriceTagButton()
                        ],
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

class ProductProperties extends StatefulWidget {
  final List<Property> propertyList;

  const ProductProperties({
    Key? key,
    required this.propertyList,
  }) : super(key: key);

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
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
                    style: TextStyle(fontSize: 12, color: ConstColor.blue),
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
              margin: const EdgeInsets.only(left: 44, right: 44, top: 24),
              height: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: ConstColor.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var property = widget.propertyList[index];
                  return Text("${property.title} : ${property.value} ");
                },
                itemCount: widget.propertyList.length,
              ),
              margin: const EdgeInsets.only(left: 44, right: 44, top: 24),
              height: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: ConstColor.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  final String productDescription;
  const ProductDescription({
    Key? key,
    required this.productDescription,
  }) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
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
                  style: TextStyle(fontSize: 12, color: ConstColor.blue),
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
            margin: const EdgeInsets.only(left: 44, right: 44, top: 24),
            height: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: ConstColor.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
        ),
        Visibility(
          visible: _isVisible,
          child: Container(
            child: Text(
              widget.productDescription,
              textAlign: TextAlign.right,
              style: const TextStyle(height: 2, fontSize: 14),
            ),
            margin: const EdgeInsets.only(left: 44, right: 44, top: 24),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: ConstColor.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ],
    ));
  }
}

class VariantContainerGenerator extends StatelessWidget {
  final List<ProductVariant> productVariantList;
  const VariantContainerGenerator({
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
  final ProductVariant productVariant;
  const VariantGeneratorChild({super.key, required this.productVariant});

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
                ColorVariantList(variantList: productVariant.variantList),
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
  final List<ProductImage> productImageList;
  final String defaultProductThumbnail;

  const GalleryWidget({
    Key? key,
    required this.productImageList,
    required this.defaultProductThumbnail,
  }) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int _selectedItem = 0;

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
                        height: 200,
                        width: 200,
                        child: CachedImage(
                            imageUrl: (widget.productImageList.isEmpty)
                                ? widget.defaultProductThumbnail
                                : widget
                                    .productImageList[_selectedItem].imageUrl!),
                      ),
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
              if (widget.productImageList.isNotEmpty) ...{
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedItem = index;
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
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  final Product product;
  const AddToBasketButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductBloc>().add(ProductAddToBasket(product));
        context.read<BasketBloc>().add(BasketFetchFromHiveEvent());
      },
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
                    ),
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
                  padding: const EdgeInsets.all(8.0),
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
                      const SizedBox(
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

List<Widget> buildColorVariantsOption(List<Variant> variantList) {
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
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
    colorWidgets.add(item);
  }

  return colorWidgets;
}

class ColorVariantList extends StatefulWidget {
  final List<Variant> variantList;
  const ColorVariantList({super.key, required this.variantList});

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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  final List<Variant> storageVariantList;
  const StorageVariantList({
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
          itemCount: widget.storageVariantList.length,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    widget.storageVariantList[index].value ?? "128",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
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
