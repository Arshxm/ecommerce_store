import 'package:ecommerce_store/bloc/basket/basket_bloc.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/model/product.dart';
import 'package:ecommerce_store/screens/product_details_screen.dart';
import 'package:ecommerce_store/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/colors.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider<BasketBloc>.value(
              value: locator.get<BasketBloc>(),
              child: ProductDetailsScreen(product: product,),
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        height: 216,
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedImage(
                      imageUrl: product.thumbnail,
                    )),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                          child: Text(
                            '${product.percent!.round().toString()}%',
                            style: const TextStyle(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            Container(
              height: 56,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${product.realPrice}",
                          style: const TextStyle(
                            fontFamily: 'RM',
                            fontSize: 12,
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                          ),
                        ),
                        Text(
                          "${product.price}",
                          style: const TextStyle(
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
      ),
    );
  }
}
