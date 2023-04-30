import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xffED9728);
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color ligthgray = const Color(0xff9E9E9E);
  static Color primaryOpacity70 = const Color(0xffb3ed9728);

  // new colors
  static Color darkPrimary = const Color(0xffd17d11);
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34);
  static Color black = const Color(0xff000000); // red color
  static Color blue = const Color.fromARGB(255, 28, 111, 184); // red color
  static Color babyblue = const Color.fromARGB(255, 172, 215, 252); // red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "ff$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
