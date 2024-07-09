import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/services/http_util.dart';

class CourseAuthorRepo {
  static authorCourseList({AuthorRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/authorCourseList',
      queryParameters: params!.toJson(),
    );

    return CourseListResponseEntity.fromJson(response);
  }

  static courseAuthor({AuthorRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/courseAuthor', queryParameters: params!.toJson());
    return AuthorResponseEntity.fromJson(response);
  }
}
