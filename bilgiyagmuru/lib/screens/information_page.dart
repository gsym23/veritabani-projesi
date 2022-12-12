import 'package:flutter/material.dart';

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
        child: Center(
            child: Text(
          information,
          style: interestedInformation,
          textAlign: TextAlign.center,
        )),
      );
    });
  }
}
