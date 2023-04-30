import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';

class OffersSlider extends StatefulWidget {
  const OffersSlider({super.key});

  @override
  State<OffersSlider> createState() => _OffersSliderState();
}

class _OffersSliderState extends State<OffersSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              aspectRatio: 17 / 7,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          itemCount: 3,
          carouselController: _controller,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8, vertical: 0),
            width: width(context) * .8,
            child: Image.asset(
              images[itemIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 5.0,
                height: 5.0,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (_current == entry.key)
                        ? ColorManager.primary
                        : ColorManager.grey2),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

List<String> images = [
  'assets/images/offers/offers1.jpg',
  'assets/images/offers/offers3.jpg',
  'assets/images/offers/offers4.png',
];
