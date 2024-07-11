import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/app_colors.dart';

Widget text24Normal(
    {required String line,
    Color color = AppColors.primaryText,
    FontWeight fontweight = FontWeight.normal,
    double fontsize = 26,
    TextOverflow? textoverflow = null,
    TextAlign? textAlign = null,
    int? maxLines}) {
  return Text(
    line,
    maxLines: maxLines,
    textAlign: textAlign,
    style: TextStyle(
        overflow: textoverflow,
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight),
  );
}

// Widget text16Normal(
//     {required String line,
//     Color color = AppColors.primarySecondaryElementText,
//     FontWeight fontweight = FontWeight.normal}) {
//   return Text(
//     line,
//     textAlign: TextAlign.center,
//     style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600),
//   );
// }

Widget text14Normal(
    {required String line, Color color = AppColors.primaryThreeElementText}) {
  return Text(
    line,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
}

class Text16Normal extends StatelessWidget {
  final String line;
  final Color color;
  final FontWeight fontWeight;

  const Text16Normal(
      {super.key,
      required this.line,
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Text(
      line!,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 18, fontWeight: fontWeight),
    );
  }
}

class Text10normal extends StatelessWidget {
  const Text10normal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "See all",
      style: TextStyle(color: AppColors.primaryThreeElementText, fontSize: 14),
    );
  }
}

class FadeText extends StatelessWidget {
  final String name;

  const FadeText({
    this.name = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      name,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
          color: Colors.grey.shade300,
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );
  }
}

class Text11normal extends StatelessWidget {
  final String line;
  final Color color;

  const Text11normal({
    this.line = "",
    this.color = AppColors.primaryElementText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      line,
      style: TextStyle(color: color, fontSize: 14),
    );
  }
}

Widget appTextFieldWithoutIcon({
  required Size size,
  TextEditingController? controller,
  String hint = "Type your search",
  bool obscure = false,
  void Function(String)? func,
}) {
  return Container(
      height: size.height * 0.06,
      width: size.width * 0.724,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, top: 25),
          hintText: hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        autocorrect: false,
        obscureText: obscure,
        maxLines: 1,
        //onChanged: (value) => func!(value),
      ));
}

Widget searchTextField(
    {required Size size,
    TextEditingController? controller,
    required String hint,
    void Function(String)? func}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.multiline,
    onChanged: func,
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(5),
      hintText: hint,
      border: InputBorder.none,
    ),
    autocorrect: false,
    maxLines: 1,
    //onChanged: (value) => func!(value),
  );
}
