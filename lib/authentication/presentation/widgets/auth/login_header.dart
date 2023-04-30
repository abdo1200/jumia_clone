import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/strings_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: AppSize.s40,
          backgroundColor: ColorManager.primary,
          child: Icon(
            Icons.star,
            color: ColorManager.white,
            size: AppSize.s60,
          ),
        ),
        heightSpace(AppSize.s14),
        Text(
          AppStrings.welcomJumia,
          style: getBoldStyle(color: ColorManager.black, fontSize: AppSize.s18),
        ),
        heightSpace(AppSize.s14),
        Text(
          AppStrings.loginText,
          style:
              getRegularStyle(color: ColorManager.black, fontSize: AppSize.s14),
          textAlign: TextAlign.center,
        ),
        heightSpace(AppSize.s14),
      ],
    );
  }
}
