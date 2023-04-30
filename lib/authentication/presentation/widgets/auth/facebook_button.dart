import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumia_clone/authentication/presentation/controller/user_bloc.dart';
import 'package:jumia_clone/core/enums.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/strings_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';
import 'package:jumia_clone/products/presentation/screens/home_screen.dart';

class FacebookButton extends StatefulWidget {
  const FacebookButton({super.key});

  @override
  State<FacebookButton> createState() => _FacebookButtonState();
}

class _FacebookButtonState extends State<FacebookButton> {
  bool unpressed = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.userState == RequestState.loaded) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
          setState(() {
            unpressed = true;
          });
        }
      },
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(FacebookLoginEvent());
          setState(() {
            unpressed = false;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.blue,
            fixedSize: unpressed
                ? const Size.fromHeight(40)
                : const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12))),
        child: Visibility(
          visible: unpressed,
          replacement: CircularProgressIndicator(color: ColorManager.white),
          child: Text(
            AppStrings.loginFacebookButton,
            style: getRegularStyle(
                color: ColorManager.white, fontSize: AppSize.s14),
          ),
        ),
      ),
    );
  }
}
