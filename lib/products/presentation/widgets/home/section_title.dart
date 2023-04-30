import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';

class SectionTitle extends StatelessWidget {
  final String titel;
  const SectionTitle({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: const EdgeInsets.all(4),
      color: ColorManager.babyblue,
      child: Text(
        titel,
        textAlign: TextAlign.center,
        style: getBoldStyle(color: ColorManager.black),
      ),
    );
  }
}
