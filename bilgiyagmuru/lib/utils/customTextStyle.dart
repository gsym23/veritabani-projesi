import 'package:flutter/material.dart';

class CustomTextStyle {
  static const titleTextStyle =
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
}

Widget customText(String text, Color color) => Text(
      text,
      style: TextStyle(color: color, fontSize: 21, fontWeight: FontWeight.bold),
    );
