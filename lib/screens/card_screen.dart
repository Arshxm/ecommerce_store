import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: Center(
        child: Container(
          height: 249,
          margin: const EdgeInsets.symmetric(horizontal: 44),
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
        ),
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
          borderRadius:
              const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              width: 1, color: ConstColor.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 2, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("1"),
            Image.asset(
                'assets/images/icon_options.png')
          ],
        ),
      ),
    );
  }
}
