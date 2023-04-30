import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumia_clone/authentication/presentation/controller/user_bloc.dart';
import 'package:jumia_clone/authentication/presentation/screens/login_screen.dart';
import 'package:jumia_clone/core/enums.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/services/services_locator.dart';
import 'package:jumia_clone/products/presentation/widgets/build_user_home.dart';

class HomeScreen extends StatefulWidget {
  // UserEvent userEvent;
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<UserBloc, UserState>(
          bloc: sl<UserBloc>()..add(CheckAuthEvent()),
          listener: (context, state) {
            if (state.userState == RequestState.loaded && state.user.id == '') {
              print(state.user.displayName);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            }
          },
          child: const BuildUserHome(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Categories',
                activeIcon: Icon(Icons.view_list_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_input_antenna_rounded),
                label: 'Feed'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.help_outline), label: 'Help'),
          ],
          currentIndex: selected,
          unselectedLabelStyle:
              getRegularStyle(color: ColorManager.darkGrey, fontSize: 11),
          selectedLabelStyle:
              getRegularStyle(color: ColorManager.darkGrey, fontSize: 11),
          fixedColor: ColorManager.primary,
          showUnselectedLabels: true,
          unselectedItemColor: ColorManager.darkGrey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            //controller.jumpToPage(index);
            setState(() {
              selected = index;
            });
          },
        ),
      ),
    );
  }
}
