import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFF016B);
  static const Color primaryLight = Color(0xFFFF4593);
  static const Color primaryPartial = Color(0xB2611132);
  static Color primaryPinkColor = fromHex('#FF006B');
  static Color primaryBlackColor = fromHex('#0E0D0D');
  static Color textWhite = fromHex('#FCFCFC');
  static Color greyBorderIconColor = fromHex('#3A3A3A');
  static Color greyText = fromHex('#ADADAD');
  static const Color textWhiteThin = Color(0xFFD9D9D9);
  static const Color red = Color(0xFFE90000);
  static const Color blue = Color(0xFF45FFF4);
  static const Color purple = Color(0xFF7000FF);
  static const Color black58 = Color(0xFF3A3A3A);
  static const Color black31 = Color(0xFF1F1F1F);
  static const Color black13 = Color(0xFF0D0C0D);
  static const Color white245 = Color(0xFFF5F5F5);
  static const Color shadowColor = Color(0xFF595959);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
