import 'package:flutter/material.dart';

class CustomTextStyle {
  static const titleTextStyle =
      TextStyle(fontSize: 31, color: Colors.white, fontWeight: FontWeight.w400, fontFamily: "YanoneKaffeesatz");
}

Widget customText(String text, Color color) => Text(
      text,
      style: TextStyle(color: color, fontSize: 21, fontWeight: FontWeight.w400, fontFamily: "YanoneKaffeesatz"),
    );
