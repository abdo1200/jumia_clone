import 'package:flutter/material.dart';

class InstallmentsWidget extends StatelessWidget {
  const InstallmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/images/offers/bankmisr.jpg"),
      ),
    );
  }
}
