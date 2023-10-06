import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';

class CustomTextStyles {
  static TextStyle thinTextStyle = TextStyle(
    color: AppColors.textWhite,
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w300,
    height: 1.50,
    letterSpacing: -0.60,
  );

  static TextStyle regularTextStyle = TextStyle(
    color: AppColors.textWhite,
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.60,
  );

  static TextStyle boldTextStyle = TextStyle(
    color: AppColors.textWhite,
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    letterSpacing: -0.60,
  );

  static TextStyle headline4ThinStyle = TextStyle(
    color: AppColors.textWhite,
    fontSize: 24,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w300,
    height: 1.20,
    letterSpacing: -0.60,
  );

  static TextStyle headline4BoldStyle = TextStyle(
    color: AppColors.textWhite,
    fontSize: 24,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    height: 1.20,
    letterSpacing: -0.60,
  );

  static TextStyle headline3BoldStyle = TextStyle(
    color: AppColors.textWhite,
    fontSize: 28,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
    height: 1.20,
    letterSpacing: -0.60,
  );
}
