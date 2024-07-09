import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/global.dart';
import 'package:learnhub/pages/sign_in/View/sign_in_page.dart';
import 'package:learnhub/pages/welcome/widget_welcome.dart';

import 'Provider/welcome_notifier.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class WelcomePage extends ConsumerWidget {
  WelcomePage({super.key});

  static final String routeName = "/welcome";

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final index = ref.watch(welcomeProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          //margin: EdgeInsets.only(top: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Container(
              //   child: PageView(
              //     children: [
              //       Image.asset("assets/images/reading.png"),
              //       Image.asset("assets/images/boy.png"),
              //     ],
              //   ),
              // ),
              PageView(
                onPageChanged: (value) {
                  ref.read(welcomeProvider.notifier).changeIndex(value);
                },
                controller: _controller,
                children: [
                  AppOnBoarding(_controller, context,
                      title: "First Line Learning",
                      imagePath: "assets/images/reading.png",
                      subTitle:
                          "Forget about of paper all knowledge in one learning",
                      size: size,
                      index: 1),
                  AppOnBoarding(_controller, context,
                      title: "Connect with Everyone",
                      imagePath: "assets/images/man.png",
                      subTitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      size: size,
                      index: 2),
                  AppOnBoarding(_controller, context,
                      title: "Always Fascinated Learning",
                      imagePath: "assets/images/boy.png",
                      subTitle:
                          "Anywhere, anytime. The time is at your discretion. So study wherever you want",
                      size: size,
                      index: 3),
                ],
              ),
              //showing dots
              Positioned(
                  bottom: 50,
                  //   left: 160,
                  child: DotsIndicator(
                    position: index,
                    decorator: DotsDecorator(
                        size: Size.square(9.0),
                        activeSize: Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    dotsCount: 3,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Widget appOnBoardingScreen(PageController controller, BuildContext context,
  //     {required String title,
  //     required String imagePath,
  //     required String subTitle,
  //     required Size size,
  //     int index = 0}) {
  //   return Column(
  //     children: [
  //       Container(
  //           //margin: EdgeInsets.only(top: size.height * 0.08),
  //           child: Image.asset(imagePath)),
  //       Container(child: text24Normal(line: title)),
  //       Container(
  //         margin: EdgeInsets.only(top: size.height * 0.02),
  //         padding: EdgeInsets.only(
  //             left: size.width * 0.02, right: size.width * 0.02),
  //         child: text16Normal(line: subTitle),
  //       ),
  //       nextButton(size, index, controller, context),
  //     ],
  //   );
  // }


}

class AppOnBoarding extends StatelessWidget {
  final String title;
  final String imagePath;
  final String subTitle;
  final Size size;
  final int index;
  final PageController controller;
  final BuildContext context;

  const AppOnBoarding(
      this.controller, this.context,
      {super.key,
      required this.title,
      required this.imagePath,
      required this.subTitle,
      required this.size,
      required this.index });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //margin: EdgeInsets.only(top: size.height * 0.08),
            child: Image.asset(imagePath)),
        Container(child: text24Normal(line: title)),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.02),
          padding: EdgeInsets.only(
              left: size.width * 0.02, right: size.width * 0.02),
          child: Text16Normal(line: subTitle),
        ),
        nextButton(size, index, controller, context),
      ],
    );
  }
}
