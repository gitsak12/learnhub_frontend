import 'package:flutter/cupertino.dart';
import 'package:learnhub/common/utils/app_colors.dart';

Widget appImage({required String imagePath}) {
  return Image.asset(imagePath);
}

Widget appImageWithColor(
    { String? path,
    double? width,
    double? height,
    Color color = AppColors.primaryElement}) {
  return Image.asset(
    path == null ? "assets/icons/home.png" : path,
    color: color,
  );
}
