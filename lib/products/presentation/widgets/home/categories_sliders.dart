import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';

class CategoriesSliders extends StatelessWidget {
  const CategoriesSliders({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * .15,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
              width: 80,
            ),
          );
        },
      ),
    );
  }
}

List<String> images = [
  'assets/images/categories/beauty.png',
  'assets/images/categories/eid.png',
  'assets/images/categories/elect.png',
  'assets/images/categories/extra.png',
  'assets/images/categories/supermarket.png',
];
