import 'dart:async';

import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/models/lesson_entities.dart';
import 'package:learnhub/pages/course_details/repo/course_repo.dart';
import 'package:learnhub/pages/home/controller/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_controller.g.dart';

//without index param it is FutureProvider
//but with index param now it is FutureProvider with family
@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref,
    {required int index}) async {
  print('course controller');
  //this ref is used to access other notifiers
  //ref.watch(homeCourseListProvider);
  //see riverpod documentation for better clarity
  // while making api requests
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await CourseRepo.courseDetail(params: courseRequestEntity);
  if (response.code == 200)
    return response.data;
  else
    print('request failed');
  return null;
}

@riverpod
Future<List<LessonItem>?> lessonListController(LessonListControllerRef ref,
    {required int courseId}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = courseId;
  final response =
      await CourseRepo.courseLessonList(params: lessonRequestEntity);
  if (response.code == 200) return response.data;

  return null;
}
