// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_store/bloc/basket/basket_bloc.dart';
import 'package:ecommerce_store/bloc/basket/basket_state.dart';
import 'package:ecommerce_store/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:ecommerce_store/util/extensions/String_Extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // var box = Hive.box<BasketItem>('CartBox');
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 44, right: 44, bottom: 32),
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
                                Image.asset(
                                    'assets/images/icon_apple_blue.png'),
                                const Expanded(
                                  child: Text(
                                    "Shopping Cart",
                                    style: TextStyle(
                                        color: ConstColor.blue,
                                        fontFamily: 'SB',
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
                    if (state is BasketResponseState) ...{
                      state.basketItemList.fold((l) {
                        return const SliverToBoxAdapter(
                          child: Text("Noting to show TBH"),
                        );
                      }, (BasketList) {
                        return SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return CartItem(cartItem: BasketList[index]);
                          }, childCount: BasketList.length),
                        );
                      })
                    },
                    const SliverPadding(padding: EdgeInsets.only(bottom: 60))
                  ],
                ),
                if (state is BasketResponseState) ...{
                  state.totalPrice.fold((l) {
                    return const Text('Something Bad happened!');
                  }, (totalPrice) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 44, right: 44),
                      child: SizedBox(
                        height: 53,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            //context.read<BasketBloc>().add(BasketPaymentInitEvent());
                            // context.read<BasketBloc>().add(BasketPaymentRequestEvent());
                          },
                          child: Text(
                            (totalPrice == 0)
                                ? "سبد شما خالی است "
                                : "$totalPrice",
                            style: const TextStyle(
                                fontFamily: "SM", color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontFamily: "SM"),
                              backgroundColor: ConstColor.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    );
                  })
                }
              ],
            );
          },
        ),
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
  final String? color;
  final String title;
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
