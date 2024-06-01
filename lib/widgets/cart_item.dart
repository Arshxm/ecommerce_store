import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:ecommerce_store/model/cart_item.dart';
import 'package:ecommerce_store/screens/cart_screen.dart';
import 'package:ecommerce_store/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  BasketItem cartItem;
  CartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

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
                        Text(
                          cartItem.name,
                          style: const TextStyle(fontFamily: 'SB'),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 6),
                                    child: Text(
                                      "${cartItem.percent!.toInt()}",
                                      style: const TextStyle(
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
                            Text(
                              cartItem.realPrice.toString(),
                              style: const TextStyle(
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
                  child: SizedBox(
                    height: 104,
                    width: 75,
                    child: CachedImage(
                      imageUrl: cartItem.thumbnail,
                    ),
                  ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "تومان",
                  style: TextStyle(fontFamily: "SB", fontSize: 16),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  cartItem.price.toString(),
                  style: const TextStyle(fontFamily: "SB", fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
