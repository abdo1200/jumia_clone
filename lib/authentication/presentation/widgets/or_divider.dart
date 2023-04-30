import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: AppSize.s18,
          width: width(context) * .7,
          child: Divider(
            thickness: 1,
            color: ColorManager.black,
          ),
        ),
        Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('OR',
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: AppSize.s16)),
          ),
        ),
      ],
    );
  }
}
