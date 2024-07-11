import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/services/http_util.dart';

class CoursesSearchRepos {
  static Future<CourseListResponseEntity> coursesDefaultSearch() async {
    var response = await HttpUtil().post('api/coursesSearchDefault');
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> coursesSearch(
      {SearchRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/coursesSearch', queryParameters: params?.toJson());
    return CourseListResponseEntity.fromJson(response);
  }
}
