import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumia_clone/authentication/domain/usecases/email_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:jumia_clone/authentication/presentation/controller/user_bloc.dart';

import 'package:jumia_clone/core/enums.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/strings_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';

import '../../../../core/resources/value_manager.dart';
import '../../../../products/presentation/screens/home_screen.dart';

class SignButton extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  final bool signUp;
  const SignButton(
      {super.key,
      required this.signUp,
      required this.email,
      required this.password,
      required this.name});

  @override
  State<SignButton> createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  @override
  void dispose() {
    widget.email.dispose();
    widget.name.dispose();
    widget.password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool unpressed = true;
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
          setState(() {
            unpressed = false;
          });
          if (widget.signUp) {
            BlocProvider.of<UserBloc>(context).add(
              SignUpEvent(SignUpParameters(
                  widget.email.text, widget.password.text, widget.name.text)),
            );
          } else {
            BlocProvider.of<UserBloc>(context).add(
              EmailLoginEvent(EmailLoginParameters(
                  widget.email.text, widget.password.text)),
            );
          }
        },
        child: Visibility(
          visible: unpressed,
          replacement: CircularProgressIndicator(color: ColorManager.white),
          child: Text(
            widget.signUp ? AppStrings.loginCreateAcc : AppStrings.loginButton,
            style: getRegularStyle(
                color: ColorManager.white, fontSize: AppSize.s14),
          ),
        ),
      ),
    );
  }
}
