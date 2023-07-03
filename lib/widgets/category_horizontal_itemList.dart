import 'package:flutter/material.dart';

class CategoryHorizontalItemList extends StatelessWidget {
  const CategoryHorizontalItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: ShapeDecoration(
            shadows: const [
              BoxShadow(
                  color: Colors.red,
                  blurRadius: 15,
                  spreadRadius: -8,
                  offset: Offset(0.0, 10)),
            ],
            color: Colors.red,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          child: const Icon(
            Icons.ads_click_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'All',
          style: TextStyle(fontFamily: 'RB'),
        ),
      ],
    );
  }
}
