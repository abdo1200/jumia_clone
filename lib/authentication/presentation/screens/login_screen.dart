import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumia_clone/authentication/presentation/controller/user_bloc.dart';
import 'package:jumia_clone/authentication/presentation/widgets/auth/facebook_button.dart';
import 'package:jumia_clone/authentication/presentation/widgets/auth/login_header.dart';
import 'package:jumia_clone/authentication/presentation/widgets/auth/sign_button.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/strings_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';
import 'package:jumia_clone/core/services/services_locator.dart';

import '../widgets/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  String buttonText = AppStrings.loginButton;
  bool signUp = false;
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LoginHeader(),
                    TextField(
                      controller: email,
                      style: getRegularStyle(color: ColorManager.black),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    heightSpace(AppSize.s14),
                    TextField(
                      controller: password,
                      style: getRegularStyle(color: ColorManager.black),
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    heightSpace(AppSize.s14),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: const SizedBox.shrink(),
                      secondChild: TextField(
                        controller: name,
                        style: getRegularStyle(color: ColorManager.black),
                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                        ),
                      ),
                      crossFadeState: showTextField
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          signUp
                              ? AppStrings.switchToLogin
                              : AppStrings.toCreateAcc,
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: AppSize.s12),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showTextField = !showTextField;
                              signUp = !signUp;
                            });
                          },
                          child: Text(
                            signUp
                                ? AppStrings.loginButton
                                : AppStrings.loginCreateAcc,
                            style: getRegularStyle(
                                color: ColorManager.darkPrimary,
                                fontSize: AppSize.s14),
                          ),
                        )
                      ],
                    ),
                    SignButton(
                      signUp: signUp,
                      email: email,
                      password: password,
                      name: name,
                    ),
                    AnimatedOpacity(
                      opacity: signUp ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          heightSpace(AppSize.s14),
                          const OrDivider(),
                          heightSpace(AppSize.s14),
                          const FacebookButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
