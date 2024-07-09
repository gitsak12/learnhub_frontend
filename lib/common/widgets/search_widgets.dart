import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/sign_in/View/widgets/sign_in_widgets.dart';

import '../utils/image_res.dart';
import 'image_widgets.dart';

Widget searchBar(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text box
      Container(
        height: size.height * 0.05,
        width: size.width * 0.77,
        //color: Colors.black,
        decoration: appBoxShadow(
            blur: 5,
            spread: 0.01,
            color: AppColors.primaryBackground,
            boxborder: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: SizedBox(
                  height: size.height * 0.022,
                  child: appImageWithColor(
                      path: ImageRes.search,
                      color: AppColors.primaryFourElementText)),
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              height: size.height * 0.2,
              width: size.width * 0.55,
              //color:  Colors.red,
              child: appTextFieldWithoutIcon(
                  size: size, hint: "Search your Course"),
            ),
          ],
        ),
      ),
      //filter
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.only(left: 9),
          height: size.height * 0.05,
          width: size.width * 0.1,
          decoration: appBoxShadow(
            boxborder: Border.all(color: AppColors.primaryElement),
          ),
          child: appImage(imagePath: ImageRes.searchButton),
        ),
      ),
    ],
  );
}
