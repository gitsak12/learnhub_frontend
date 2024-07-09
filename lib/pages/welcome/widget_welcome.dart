import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/app_constants.dart';
import '../../common/widgets/app_box_shadow.dart';
import '../../common/widgets/text_widgets.dart';
import '../../global.dart';

Widget nextButton(
    Size size, int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () async {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear);
      } else {
        print("setfirsttime");
        Global.storageService
            .isFirstTime(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, "/signInPage");
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(top: size.height * 0.14),
      decoration: appBoxShadow(),
      child: Center(
          child: Text16Normal(
              line: index < 3 ? "Next" : "Get Started", color: Colors.white)),
    ),
  );
}