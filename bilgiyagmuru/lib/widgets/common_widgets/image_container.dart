import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key,
      required this.height,
      required this.imagePath,
      required this.isTop});

  final double height;
  final String imagePath;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTop ? height * .25 : height * .40,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
