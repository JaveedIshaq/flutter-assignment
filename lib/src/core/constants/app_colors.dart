import 'package:flutter/material.dart';

class AppColors {
  static Color primarPinkColor = fromHex('#FF006B');
  static Color primaryBlackColor = fromHex('#0E0D0D');
  static Color textWhite = fromHex('#FCFCFC');
  static Color greyBorderIconcolor = fromHex('#3A3A3A');
  static Color greyText = fromHex('#ADADAD');

  //ADADAD

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
