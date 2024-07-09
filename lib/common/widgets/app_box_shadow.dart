import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double spread = 4.0,
    double blur = 10,
    BoxBorder? boxborder}) {
  return BoxDecoration(
      color: color,
      border: boxborder,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: spread,
            blurRadius: blur,
            offset: Offset(0, 7))
      ]);
}

BoxDecoration appBoxDecorationTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: borderColor),
  );
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double spread = 4.0,
    double blur = 10}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: spread,
            blurRadius: blur,
            offset: Offset(0, 7))
      ]);
}

class AppBoxDecorationImage extends StatelessWidget {
  final Size size;
  final String imagePath;
  final CourseItem courseItem;
  final Function() func;

  const AppBoxDecorationImage(this.size, this.imagePath,
      {super.key, required this.courseItem, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(imagePath),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: FadeText(name: courseItem.name!),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, bottom: 5),
              child: FadeText(name: courseItem.lesson_num.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
