import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

import '../const/home_page_constant.dart';
import '../const/information_page_constant.dart';
import '../models/category.dart';

class InformationPage extends StatelessWidget {
  const InformationPage(
      {super.key, required this.category, required this.information});

  final Category category;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.categoryName(),
          style: appBarTitleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(164, 140, 178, 1),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: AnimationConfiguration.synchronized(
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LottieBuilder.asset(
                "assets/animations/robot.json",
                width: 200,
                height: 200,
              ),
              ScaleAnimation(
                child: FadeInAnimation(
                  child: Container(
                    width: constraints.maxWidth / 1.5,
                    height: constraints.maxHeight / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.blue],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        information,
                        style: interestedInformation,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
