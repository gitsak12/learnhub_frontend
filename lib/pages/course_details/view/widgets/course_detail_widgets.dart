import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/models/lesson_entities.dart';
import 'package:learnhub/common/routes/app_routes_names.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/button_widgets.dart';
import 'package:learnhub/pages/lesson_detail/controller/lesson_controller.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/app_constants.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/image_widgets.dart';
import '../../../../common/widgets/text_widgets.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final Size size;
  final CourseItem courseItem;

  const CourseDetailThumbnail(
      {super.key, required this.size, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(
      //     left: size.width * 0.07,
      //     top: size.height * 0.01,
      //     right: size.width * 0.07),
      width: size.width * 0.9,
      height: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          "${AppConstants.IMAGE_UPLOAD_PATH}${courseItem.thumbnail}",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class AuthorDetails extends StatelessWidget {
  final Size size;
  final CourseItem data;

  const AuthorDetails({super.key, required this.size, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutesNames.AUTHOR, arguments: {
              'token': data.user_token,
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: size.width * 0.25,
            height: size.height * 0.03,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryElement,
            ),
            //padding: EdgeInsets,
            child: Text(
              'Author page',
              //textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 11.5),
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                  height: size.height * 0.02,
                  margin: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.01),
                  child: appImage(imagePath: ImageRes.people)),
              text24Normal(
                  line: data.follow == null ? '0' : data.follow.toString(),
                  fontsize: 15),
              Container(
                  height: size.height * 0.02,
                  margin: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.01),
                  child: appImage(imagePath: ImageRes.star)),
              text24Normal(
                  line: data.follow == null ? '0' : data.score.toString(),
                  fontsize: 15),
            ],
          ),
        ),
      ],
    );
  }
}

class CourseDetailDonateButton extends StatelessWidget {
  const CourseDetailDonateButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return appButton(
        size: size,
        buttonName: "Donate",
        isLoginButton: true,
        context: context);
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem data;

  const CourseDetailIncludes({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text24Normal(
            line: 'The Course Includes',
            fontsize: 20,
            fontweight: FontWeight.bold),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: size.width * 0.03),
                height: size.height * 0.04,
                child: appImage(imagePath: ImageRes.video_detail),
              ),
              text24Normal(
                  line: "${data.video_len} Hours Video",
                  fontsize: 15,
                  color: Colors.grey.shade600,
                  fontweight: FontWeight.bold),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: size.width * 0.03),
                height: size.height * 0.04,
                child: appImage(imagePath: ImageRes.file_detail),
              ),
              text24Normal(
                  line: "Total ${data.lesson_num} Lessons",
                  fontsize: 15,
                  color: Colors.grey.shade600,
                  fontweight: FontWeight.bold),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: size.width * 0.03),
                height: size.height * 0.04,
                child: appImage(imagePath: ImageRes.download_detail),
              ),
              text24Normal(
                  line: data.down_num == null
                      ? "0 Download Resources"
                      : "${data.down_num} Download Resources",
                  fontsize: 15,
                  color: Colors.grey.shade600,
                  fontweight: FontWeight.bold),
            ],
          ),
        ),
      ],
    );
  }
}

//'${AppConstants.IMAGE_UPLOAD_PATH}${data.thumbnail}'
class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonData;
  final WidgetRef ref;

  const LessonInfo({super.key, required this.lessonData, required this.ref});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lessonData.isNotEmpty
              ? text24Normal(
                  line: 'Lesson Info',
                  fontsize: 20,
                  fontweight: FontWeight.bold)
              : SizedBox(),
          SizedBox(
            height: size.height * 0.01,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: lessonData.length,
              itemBuilder: (_, i) {
                return InkWell(
                  onTap: () {
                    ref.watch(lessonDetailControllerProvider(
                        index: lessonData[i].id!));
                    Navigator.of(context)
                        .pushNamed('/lessonDetail', arguments: {
                      'id': lessonData[i].id,
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    decoration: appBoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        //color: Colors.red,
                        radius: 10,
                        spread: 5,
                        blur: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.04),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  '${AppConstants.IMAGE_UPLOAD_PATH}${lessonData[i].thumbnail}')),
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text24Normal(
                                  line: lessonData[i].name!,
                                  fontsize: 18,
                                  fontweight: FontWeight.bold),
                              text24Normal(
                                textoverflow: TextOverflow.ellipsis,
                                line: lessonData[i].description!,
                                fontsize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                        // Expanded(child: Container()),
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.08,
                          child: Image.asset(ImageRes.arrowRight),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
