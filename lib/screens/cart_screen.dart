// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_store/util/extensions/String_Extensions.dart';
import 'package:flutter/material.dart';
import '';
import 'package:ecommerce_store/constants/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_apple_blue.png'),
                            const Expanded(
                              child: Text(
                                "Shopping Cart",
                                style: TextStyle(
                                    color: ConstColor.blue,
                                    fontFamily: 'RB',
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return const CartItem();
                  }, childCount: 10),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 60))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 44, right: 44),
              child: SizedBox(
                height: 53,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Purchase"),
                  style: ElevatedButton.styleFrom(
                      textStyle:
                          const TextStyle(fontSize: 18, fontFamily: "RM"),
                      backgroundColor: ConstColor.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      margin: const EdgeInsets.only(right: 44, left: 44, bottom: 44),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "آیفون 13 پرو مکس",
                          style: TextStyle(fontFamily: 'SB'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "گارانتی فیلان 18 ماهه",
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 30,
                              decoration: const BoxDecoration(
                                color: ConstColor.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 6),
                                    child: Text(
                                      '%3',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "تومان",
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "49,000,000",
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Wrap(
                          spacing: 8,
                          children: [
                            const DeleteChip(),
                            OptionChip(
                              title: "آبی",
                              color: "34abeb",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset('assets/images/iphone.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 3,
              dashLength: 8.0,
              dashColor: ConstColor.grey.withOpacity(0.5),
              dashGapLength: 3.0,
              dashGapColor: Colors.transparent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تومان",
                  style: TextStyle(fontFamily: "SB", fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "49,000,000",
                  style: TextStyle(fontFamily: "SB", fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//TODO Delete Chip in cart screen
class DeleteChip extends StatelessWidget {
  const DeleteChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: ConstColor.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "حذف",
              style: TextStyle(fontFamily: 'SM', fontSize: 12),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 4,
            ),
            Image.asset('assets/images/icon_trash.png')
          ],
        ),
      ),
    );
  }
}

//TODO Chip in cart screen
class OptionChip extends StatelessWidget {
  String? color;
  String title;
  OptionChip({
    Key? key,
    this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: ConstColor.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (color != null) ...{
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color!.colorParse(),
                ),
              )
            },
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: 'SM', fontSize: 12),
              textDirection: TextDirection.rtl,
            ),
            // Image.asset('assets/images/icon_options.png')
          ],
        ),
      ),
    );
  }
}

