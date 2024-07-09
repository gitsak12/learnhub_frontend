import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/app_styles.dart';
import 'package:learnhub/common/routes/app_routes_names.dart';
import 'package:learnhub/common/services/http_util.dart';
import 'package:learnhub/firebase_options.dart';
import 'package:learnhub/global.dart';
import 'package:learnhub/pages/application/View/application.dart';
import 'package:learnhub/pages/sign_in/View/sign_in_page.dart';
import 'package:learnhub/pages/sign_up/View/sign_up_page.dart';
import 'package:learnhub/pages/welcome/welcome_page.dart';

Future<void> main() async {
  await Global
      .init(); // if this has been used more than once then add await keyword
  // await HttpUtil().post("api/login", queryParameters: {
  //   "name": "sak",
  //   "email": "sambox.com",
  //   "avatar": "tursn",
  //
  //   "open_id": "qwerty",
  //   "type": 2,
  // });
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

final GlobalKey<NavigatorState> navkey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LearnHub",
      theme: AppStyles.appThemeData,
      //initialRoute: AppRoutesNames.WELCOME,
      //home: WelcomePage(),
      //initial route "/"
      // routes: {
      //   '/signInPage': (context) => SignInPage(),
      //   "/signUpPage": (context) => SignUpPage(),
      //   "/application": (context) => Application(),
      // },
      navigatorKey: navkey,
      onGenerateRoute: (RouteSettings settings) =>
          AppPages.generateRouteSettings(settings),
    );
  }
}

final appCount = StateProvider<int>((ref) => 1);

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("$count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appCount.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
