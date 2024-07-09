import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/sign_up/View/sign_up_page.dart';

Widget appButton(
    {required Size size,
    required String buttonName,
    required bool isLoginButton,
    required BuildContext context,
    void Function()? func = null}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      //margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      width: size.width * 0.9,
      height: size.height * 0.07,
      decoration: appBoxShadow(
          color: isLoginButton ? AppColors.primaryElement : Colors.white),
      child: Center(
        child: Text16Normal(
            line: buttonName,
            color: isLoginButton ? AppColors.primaryBackground : Colors.black),
      ),
    ),
  );
}
