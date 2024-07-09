import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/pages/application/View/application.dart';
import 'package:learnhub/pages/author_page/view/author_page.dart';
import 'package:learnhub/pages/course_details/view/course_detail.dart';
import 'package:learnhub/pages/home/view/home.dart';
import 'package:learnhub/pages/lesson_detail/view/lesson_detail.dart';
import 'package:learnhub/pages/settings/view/settingss.dart';
import 'package:learnhub/pages/sign_in/View/sign_in_page.dart';
import 'package:learnhub/pages/sign_up/View/sign_up_page.dart';
import 'package:learnhub/pages/welcome/welcome_page.dart';

import '../../global.dart';

class AppRoutesNames {
  static const String WELCOME = "/";
  static const String SIGN_IN = "/signInPage";
  static const String REGISTER = "/signUpPage";
  static const String APPLICATION = "/application";
  static const String HOME = "/home";
  static const String COURSE_DETAIL = '/courseDetail';
  static const String LESSON_DETAIL = '/lessonDetail';
  static const String SETTINGSS = '/settingss';
  static const String AUTHOR = '/author';
}

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: WelcomePage()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: SignInPage()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: SignUpPage()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: Home()),
      RouteEntity(path: AppRoutesNames.COURSE_DETAIL, page: CourseDetail()),
      RouteEntity(path: AppRoutesNames.LESSON_DETAIL, page: LessonDetail()),
      RouteEntity(path: AppRoutesNames.SETTINGSS, page: Settingss()),
      RouteEntity(path: AppRoutesNames.AUTHOR, page: AuthorPage()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    //initially when this function calls initial route is '/' and it routes to the
    //screen we have added , now we are assigning our route to welcomePage

    //print(result.isNotEmpty);

    //Global.storageService
    //    .isFirstTime(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, false);

    //basically our initial route is the route which we pass below
    if (kDebugMode) print(routeSettings.name);
    if (routeSettings.name != null) {
      var result = routes().where((e) => e.path == routeSettings.name);

      if (result.isNotEmpty) {
        bool deviceFirstTime = Global.storageService.getIsFirstTime();
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          print("entering");
          bool isLoggedIn = Global.storageService.isLogged();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => Application(), settings: routeSettings);
          } else {
            return MaterialPageRoute(
                builder: (_) => SignInPage(), settings: routeSettings);
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: routeSettings);
        }
      }
    }
    return MaterialPageRoute(
        builder: (_) => WelcomePage(), settings: routeSettings);
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
