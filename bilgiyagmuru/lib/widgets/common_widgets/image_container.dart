import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.height, required this.imagePath});

  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .25,
      decoration:  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
