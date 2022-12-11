import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../const/home_page_constant.dart';
import '../models/category.dart';
import '../widgets/home_page_widgets/category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // final AppUser user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = <Category>[
    Category(categoryId: 0, category: Categories.gundem),
    Category(categoryId: 1, category: Categories.teknoloji),
    Category(categoryId: 2, category: Categories.finans),
    Category(categoryId: 3, category: Categories.bilim),
    Category(categoryId: 4, category: Categories.tv),
    Category(categoryId: 5, category: Categories.absurt),
    Category(categoryId: 6, category: Categories.oyun),
    Category(categoryId: 7, category: Categories.spor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Kategoriler",
            style: appBarTitleTextStyle,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(164, 140, 178, 1),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: buildBody());
  }

  buildBody() {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: List.generate(categories.length, (index) {
                return AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: 2,
                    duration: const Duration(seconds: 1),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: CategoryWidget(
                          category: categories[index],
                        ),
                      ),
                    ));
              }),
            ),
          ),
        ),
      );
    });
  }
}
