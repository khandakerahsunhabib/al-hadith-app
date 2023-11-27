import 'package:flutter/material.dart';

extension StringExtension on String {
  Color toColor() {
    String hexColor = toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor += "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  String firstChar() {
    return substring(0, 1);
  }
}
