import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/app_bar.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/image_widgets.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/course_details/controller/course_controller.dart';
import 'package:learnhub/pages/course_details/view/widgets/course_detail_widgets.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var courseData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    var lessonData =
        ref.watch(lessonListControllerProvider(courseId: args.toInt()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(line: "Course Detail"),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseData.when(data: (data) {
                return Column(
                  children: [
                    CourseDetailThumbnail(size: size, courseItem: data!),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    // AuthorDetails(
                    //   data: data,
                    //   size: size,
                    // ),
                    SizedBox(height: size.height * 0.01),
                    text24Normal(
                        line: 'Course Description',
                        fontsize: 25,
                        fontweight: FontWeight.bold),
                    SizedBox(height: size.height * 0.001),
                    text24Normal(
                        line: data.description!,
                        fontsize: 12,
                        fontweight: FontWeight.bold,
                        color: Colors.grey),
                    SizedBox(height: size.height * 0.02),
                    const CourseDetailDonateButton(),
                    SizedBox(height: size.height * 0.022),
                    CourseDetailIncludes(data: data),
                    SizedBox(height: size.height * 0.022),
                  ],
                );
              }, error: (error, stack) {
                return Text(error.toString());
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
              lessonData.when(data: (data) {
                return LessonInfo(lessonData: data!, ref: ref);
              }, error: (error, stack) {
                return Text(error.toString());
              }, loading: () {
                return Center();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// LessonInfo(
// data: data,
// ),
