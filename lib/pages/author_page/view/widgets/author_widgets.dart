import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/utils/app_constants.dart';

import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/app_box_shadow.dart';
import '../../../../common/widgets/text_widgets.dart';

class AuthorPageCoverPhotoAndName extends StatelessWidget {
  const AuthorPageCoverPhotoAndName({super.key, required this.authorInfo});

  final AuthorItem authorInfo;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.red,
      width: size.width,
      height: size.height * 0.28,
      margin: EdgeInsets.only(bottom: size.height * 0.04),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(ImageRes.background)),
            ),
          ),
          Positioned(
              left: size.width * 0.06,
              bottom: size.height * 0.0008,
              child: Image.network(
                '${AppConstants.IMAGE_UPLOAD_PATH}${authorInfo.avatar}',
                height: size.height * 0.1,
              )),
          Positioned(
            left: size.width * 0.28,
            bottom: size.height * 0.003,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text24Normal(
                    line: authorInfo.name!,
                    fontsize: 14,
                    fontweight: FontWeight.bold),
                text24Normal(
                    line: authorInfo.job ?? 'A freelancer',
                    fontsize: 11,
                    color: Colors.grey.shade500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorDescription extends StatelessWidget {
  const AuthorDescription({super.key, required this.authorItem});

  final AuthorItem authorItem;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text24Normal(
              line: 'About Me',
              color: Colors.black,
              fontweight: FontWeight.bold,
              fontsize: 18),
          text24Normal(
            line: authorItem.description ??
                'I am flutter developer, helping to build flutter community',
            color: Colors.grey,
            fontsize: 12,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );
  }
}

class AuthorCoursesList extends StatelessWidget {
  final List<CourseItem> courseData;

  const AuthorCoursesList({super.key, required this.courseData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          courseData.isNotEmpty
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
              itemCount: courseData.length,
              itemBuilder: (_, i) {
                return InkWell(
                  onTap: () {
                    // ref.watch(lessonDetailControllerProvider(
                    //     index: lessonData[i].id!));
                    Navigator.of(context)
                        .pushNamed('/courseDetail', arguments: {
                      'id': courseData[i].id,
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
                                  fit: BoxFit.fitWidth,
                                  width: size.width * 0.1,
                                  '${AppConstants.IMAGE_UPLOAD_PATH}${courseData[i].thumbnail}')),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text24Normal(
                                  line: courseData[i].name!,
                                  fontsize: 18,
                                  fontweight: FontWeight.bold,
                                  textoverflow: TextOverflow.ellipsis),
                              text24Normal(
                                textoverflow: TextOverflow.ellipsis,
                                line: courseData[i].description!,
                                fontsize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
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
