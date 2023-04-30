import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/color_manager.dart';

import '../../../../core/resources/style_manager.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController,
      style: getRegularStyle(color: ColorManager.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.white,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search on Jumia',
      ),
      onSubmitted: (value) {
        // Store the entered password securely and send it to your API or backend
        //final securedPassword = hashPassword(value);
        // ...
      },
    );
  }
}
