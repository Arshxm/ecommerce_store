import 'dart:ui';

import 'package:ecommerce_store/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
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
                      const Expanded(
                        child: Text(
                          "iPhone",
                          style: TextStyle(
                              color: ConstColor.blue,
                              fontFamily: 'RB',
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset('assets/images/icon_back.png'),
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
                  "iPhone SE 2022",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'RB',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
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
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/icon_star.png'),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text('4.6',
                                      style: TextStyle(
                                          fontFamily: 'RM', fontSize: 12)),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                  height: double.infinity,
                                  child:
                                      Image.asset('assets/images/iphone.png')),
                              const Spacer(),
                              Image.asset(
                                  'assets/images/icon_favorite_deactive.png')
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
                              return Container(
                                margin: const EdgeInsets.only(left: 20),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                    width: 1,
                                    color: ConstColor.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child:
                                      Image.asset('assets/images/iphone.png'),
                                ),
                              );
                            },
                            itemCount: 3,
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 44,
                  left: 44,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Color",
                      style: TextStyle(fontFamily: 'RM', fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 44,
                  left: 44,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Internal Storage",
                      style: TextStyle(fontFamily: 'RM', fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 74,
                          height: 26,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              "128",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'RB', fontSize: 12),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border:
                                  Border.all(width: 1, color: ConstColor.grey)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 74,
                          height: 26,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              "128",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'RB', fontSize: 12),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border:
                                  Border.all(width: 1, color: ConstColor.grey)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 74,
                          height: 26,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              "128",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'RB', fontSize: 12),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border:
                                  Border.all(width: 1, color: ConstColor.grey)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            //Technical details

            SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Technical Details :",
                      style: TextStyle(fontFamily: "RM"),
                    ),
                    const Spacer(),
                    const Text(
                      "Show",
                      style: TextStyle(
                          fontFamily: 'RB',
                          fontSize: 12,
                          color: ConstColor.blue),
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

            //About Product

            SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "About Product :",
                      style: TextStyle(fontFamily: "RM"),
                    ),
                    const Spacer(),
                    const Text(
                      "Show",
                      style: TextStyle(
                          fontFamily: 'RB',
                          fontSize: 12,
                          color: ConstColor.blue),
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

            // Reviews

            SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Reviews :",
                      style: TextStyle(fontFamily: "RM"),
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
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Positioned(
                          left: 15,
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
                          left: 30,
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
                          left: 45,
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
                          left: 60,
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
                                  fontFamily: "RB",
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
                      "Show",
                      style: TextStyle(
                          fontFamily: 'RB',
                          fontSize: 12,
                          color: ConstColor.blue),
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
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  "Add to Cart",
                  style: TextStyle(
                    fontFamily: "RB",
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ),
        )
      ],
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
                      const Text(
                        "IRR",
                        style: TextStyle(color: Colors.white),
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
                              fontFamily: 'RM',
                              fontSize: 12,
                              color: Colors.white,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                            ),
                          ),
                          Text(
                            "48,800,000",
                            style: TextStyle(
                              fontFamily: 'RM',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
                                      color: Colors.white,
                                      fontFamily: 'RM',
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
