import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:flutter/material.dart';

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
                    return CartItem();
                  }, childCount: 10),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 60))
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
                    textStyle: TextStyle(fontSize: 18, fontFamily: "RM"),
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
                        const Text("1"),
                        const Text("1"),
                        Row(
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
                            const Text("49,000,000"),
                            const Text("Toman"),
                          ],
                        ),
                        const Wrap(
                          children: [
                            OptionChip(),
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
                Text("49,000,000"),
                SizedBox(
                  width: 5,
                ),
                Text("Toman"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionChip extends StatelessWidget {
  const OptionChip({
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
            const Text("1"),
            Image.asset('assets/images/icon_options.png')
          ],
        ),
      ),
    );
  }
}
