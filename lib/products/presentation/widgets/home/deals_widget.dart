import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';

class DealsWidget extends StatelessWidget {
  const DealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * .2,
        width: width(context),
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 5,
            alignment: WrapAlignment.spaceAround,
            children: images.map((String item) {
              return SizedBox(
                width: width(context) * .47,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }).toList()));
  }
}

List<String> images = [
  'assets/images/deals/deal1.jpg',
  'assets/images/deals/deal2.jpg',
  'assets/images/deals/deal3.jpg',
  'assets/images/deals/deal4.png',
];
