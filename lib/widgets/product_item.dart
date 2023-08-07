import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      height: 216,
      width: 160,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/iphone.png'),
              Container(),
              Positioned(
                right: 10,
                top: 0,
                child: Image.asset('assets/images/active_fav_product.png'),
              ),
              Positioned(
                left: 10,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: ConstColor.red,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 6),
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
          const Spacer(),
          const Text(
            'iPhone 13 PRO MAX',
            style: TextStyle(fontFamily: 'RM', fontSize: 14),
          ),
          const Spacer(),
          Container(
            height: 53,
            decoration: const BoxDecoration(
              color: ConstColor.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: ConstColor.blue,
                  blurRadius: 25,
                  spreadRadius: -12,
                  offset: Offset(0.0, 15),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const Spacer(),
                  SizedBox(
                    width: 24,
                    child: Image.asset(
                      'assets/images/icon_right_arrow_circle.png',
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
