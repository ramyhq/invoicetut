import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF1976D2);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF1E88E5);

//Backgrounds colors
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = const Color(0xff212121);

//Text Colors
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = const Color(0xff16161C);

  static Color transparent = const Color(0x00000000);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xffffffff);

  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xFF1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);

  static Color grey = Colors.grey;
  static Color red = Colors.red;
  static Color yellow = Colors.yellow;
  static Color orange = Colors.orange;
  static Color green = Colors.green;


  static Color getColorCircleProgress(double s) {
    Color r = AppColors.red;
    if (s > 4.5 && s < 7) {
      r = AppColors.yellow;
    } else if (s >= 7) {
      r = AppColors.green;
    }
    return r;
  }
}
