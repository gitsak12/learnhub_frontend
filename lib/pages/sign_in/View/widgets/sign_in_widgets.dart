import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/image_widgets.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';

Widget thirdPartyLogin(Size size) {
  return Container(
    margin: EdgeInsets.fromLTRB(size.width * 0.2, size.height * 0.04,
        size.width * 0.22, size.height * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton(size, "assets/icons/google.png"),
        _loginButton(size, "assets/icons/apple.png"),
        _loginButton(size, "assets/icons/facebook.png")
      ],
    ),
  );
}

Widget _loginButton(Size size, String imagePath) {
  return GestureDetector(
    onTap: null,
    child: SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.1,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField(Size size,
    {String text = "",
    required String imagePath,
    required String hint,
    bool obscure = false,
    void Function(String)? func,
    TextEditingController? controller}) {
  return Container(
    padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(line: text),
        SizedBox(
          height: size.height * 0.005,
        ),
        Container(
          padding: EdgeInsets.only(
              left: size.width * 0.01, right: size.width * 0.01),
          //color: Colors.red,
          height: size.height * 0.059,
          width: size.width * 0.9,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              SizedBox(
                  height: size.height * 0.02,
                  width: size.width * 0.09,
                  child: appImage(imagePath: imagePath)),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.724,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  // decoration: InputDecoration(
                  //   hintText: hint,
                  //   border: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.transparent),
                  //       borderRadius: BorderRadius.all(Radius.circular(15))),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.transparent),
                  //   ),
                  //   focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.transparent),
                  //   ),
                  // ),
                  decoration: InputDecoration(
                    hintText: hint,

                    border: InputBorder.none,

                  ),
                  autocorrect: false,
                  obscureText: obscure,
                  maxLines: 1,
                  onChanged: (value) => func!(value),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
