import 'package:learnhub/pages/author_page/repo/course_author_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/course_entities.dart';

part 'author_controller.g.dart';

@riverpod
class AuthorCourseListController extends _$AuthorCourseListController {
  @override
  FutureOr<List<CourseItem>> build() async {
    return [];
  }

  Future<void> init(String token) async {
    loadCourseData(token);
  }

  loadCourseData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity(token: token);
    final response =
        await CourseAuthorRepo.authorCourseList(params: authorRequestEntity);
    if (response.code == 200) {
      state = AsyncValue.data(response.data);
    }
  }
}

@riverpod
class CourseAuthorController extends _$CourseAuthorController {
  @override
  FutureOr<AuthorItem?> build() async {
    return null;
  }

  Future<void> init(String token) async {
    loadAuthorData(token);
  }

  loadAuthorData(String token) async {
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity(token: token);
    final response =
        await CourseAuthorRepo.courseAuthor(params: authorRequestEntity);
    if (response.code == 200) {
      state = AsyncValue.data(response.data);
    }
  }
}
