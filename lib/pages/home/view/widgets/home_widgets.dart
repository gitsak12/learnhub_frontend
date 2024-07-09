import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/image_widgets.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/home/controller/home_controller.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../global.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          line: Global.storageService.getUserProfile().name!,
          fontweight: FontWeight.bold),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          line: "Hello,",
          color: AppColors.primaryThreeElementText,
          fontweight: FontWeight.bold),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final Size size;
  final PageController controller;
  final WidgetRef ref;

  const HomeBanner(
      {super.key,
      required this.controller,
      required this.ref,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Course photo
        SizedBox(
          width: size.width,
          height: size.height * 0.22,
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(value);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        //dots
        SizedBox(
          height: size.height * 0.01,
        ),
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: Size.square(9.0),
              activeSize: Size(24.0, 8.0),
              color: Colors.grey,
              activeColor: Colors.indigo,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ],
    );
  }
}

Widget banner(Size size, WidgetRef ref, PageController _controller) {
  return Column(
    children: [
      //Course photo
      SizedBox(
        width: size.width,
        height: size.height * 0.22,
        child: PageView(
          controller: _controller,
          onPageChanged: (value) {
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(value);
          },
          children: [
            bannerContainer(imagePath: ImageRes.banner1),
            bannerContainer(imagePath: ImageRes.banner2),
            bannerContainer(imagePath: ImageRes.banner3),
          ],
        ),
      ),
      //dots
      SizedBox(
        height: size.height * 0.01,
      ),
      DotsIndicator(
        position: ref.watch(homeScreenBannerDotsProvider),
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            size: Size.square(9.0),
            activeSize: Size(24.0, 8.0),
            color: Colors.grey,
            activeColor: Colors.indigo,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    ],
  );
}

Widget bannerContainer({required String imagePath}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
    ),
  );
}

AppBar homeAppBar(Size size, WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    forceMaterialTransparency: true,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.069,
              child: appImage(imagePath: ImageRes.menu)),
          //our state provider is async provider so we have to wait for it
          profileState.when(
              data: (data) => GestureDetector(
                    child: Container(
                      height: size.height * 1,
                      width: size.width * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "${AppConstants.IMAGE_UPLOAD_PATH}${data.avatar}"),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              error: (err, stack) => SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.069,
                  child: appImage(imagePath: ImageRes.profilePhoto)),
              loading: () => Container()),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        //course tiitle  ans see all button
        Container(
            height: size.height * 0.04,
            width: size.width,
            margin: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.01),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text16Normal(
                  line: "Choose Your Course",
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                FadeText(),
              ],
            )),
        //sorting buttons
        Container(
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: size.width * 0.05),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.004,
                      bottom: size.height * 0.004),
                  decoration: appBoxShadow(radius: 8),
                  child: Text11normal(line: "All")),
              Container(
                  margin: EdgeInsets.only(right: size.width * 0.05),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.004,
                      bottom: size.height * 0.004),
                  decoration: appBoxShadow(radius: 8, color: Colors.white),
                  child: Text11normal(
                    line: "Popular",
                    color: AppColors.primaryThreeElementText,
                  )),
              Container(
                  margin: EdgeInsets.only(right: size.width * 0.01),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.004,
                      bottom: size.height * 0.004),
                  decoration: appBoxShadow(radius: 8, color: Colors.white),
                  child: Text11normal(
                    line: "Newest",
                    color: AppColors.primaryThreeElementText,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  final Size size;

  const CourseItemGrid({super.key, required this.ref, required this.size});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);
    return courseState.when(
        data: (data) {
          return Container(
            padding: EdgeInsets.only(top: 15),
            child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.5),
                itemCount: data?.length,
                itemBuilder: (_, int index) {
                  return AppBoxDecorationImage(func: () {
                    Navigator.of(context)
                        .pushNamed('/courseDetail', arguments: {
                      "id": data[index].id,
                    });
                  },
                      size,
                      courseItem: data![index],
                      "${AppConstants.IMAGE_UPLOAD_PATH}${data![index].thumbnail}");
                }),
          );
        },
        error: (error, stack) => Center(child: Text("Error")),
        loading: () => Center(
              child: Text('loading'),
            ));
  }
}



