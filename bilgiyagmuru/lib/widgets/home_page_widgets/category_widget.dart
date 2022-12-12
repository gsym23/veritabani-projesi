import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../const/home_page_constant.dart';
import '../../models/category.dart';
import '../../providers/db_provider.dart';
import '../../screens/information_page.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        var information = await ref
            .read(firebaseProvider)
            .getInterestingInformation(category);
            
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InformationPage(
                category: category, information: information)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 199, 255, 1),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset("assets/animations/${category.categoryId}.json", width: 100, height: 100,),
              Text(
                category.categoryName(),
                style: categoryNameTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
