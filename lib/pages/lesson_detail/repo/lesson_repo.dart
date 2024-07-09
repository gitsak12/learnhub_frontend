import 'package:learnhub/common/models/lesson_entities.dart';
import 'package:learnhub/common/services/http_util.dart';

class LessonRepo {
  static Future<LessonDetailResponseEntity> lessonList(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('/api/lessonDetail', queryParameters: params?.toJson());
    return LessonDetailResponseEntity.fromJson(response);
  }
}
