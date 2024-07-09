import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/app_colors.dart';

class AppStyles {
  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white, centerTitle: true, elevation: 0),
    iconTheme: IconThemeData(
      color: AppColors.primaryText,
    ),
  );
}
