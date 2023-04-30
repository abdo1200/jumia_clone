import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/routes_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';
import 'package:jumia_clone/products/presentation/widgets/home/search_input.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManager.darkGrey),
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Row(
        children: [
          const Flexible(
            flex: 8,
            child: SearchInput(),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Badge(
                    backgroundColor: ColorManager.primary,
                    label: const Text('5'),
                    child: Icon(Icons.shopping_cart_outlined,
                        color: ColorManager.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// ! now will check if user signed in 
// make bool is signed in or not 
//make event and bloc and method