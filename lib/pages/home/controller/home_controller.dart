import 'package:learnhub/common/Api/course_api.dart';
import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/models/user.dart';
import 'package:learnhub/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true) // through keep alive true
//we make our provider not to auto dispose as we leave that page
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}

@riverpod
class HomeUserProfile extends _$HomeUserProfile {
  //this is returning us async provider
  FutureOr<UserProfile> build() {
    return Global.storageService.getUserProfile();
  }
}

//when we live home page and revisit, it make again api calls to the backend
//which is useless because my riverpod provider is autodispose, so make it
//keep alive so that it dont get destoryed
@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList {
  Future<List<CourseItem>?> fetchCourseList() async {
    var result = await CourseApi.courseList();
    if (result.code == 200) {
      return result.data;
    }
    return null;
  }

  Future<List<CourseItem>?> build() async {
    return fetchCourseList();
  }
}
