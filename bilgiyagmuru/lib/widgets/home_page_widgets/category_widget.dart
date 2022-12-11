import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../const/home_page_constant.dart';
import '../../models/category.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key, required this.category});

  final Category category;

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async{

        // await ref.read(firebaseProvider).getInterestingInformation(category);

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 199, 255, 1),
              borderRadius: BorderRadius.circular(20)),
          child:  Center(
            child: Text(
              category.categoryName(),
              style: categoryNameTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
