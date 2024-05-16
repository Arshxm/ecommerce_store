import 'package:flutter/material.dart';

extension colorParsing on String {
  Color colorParse() {
    String chipColor = "ff$this";
    int hexColor = int.parse(chipColor, radix: 16);
    return Color(hexColor);
  }
}
