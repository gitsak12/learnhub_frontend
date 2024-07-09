import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/app_bar.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/image_widgets.dart';
import 'package:learnhub/pages/application/provider/application_nav_notifier.dart';
import 'package:learnhub/pages/application/View/widgets/widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  static const routeName = '/application';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    var itemList = [
      BottomNavigationBarItem(
          icon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                  path: ImageRes.home,
                  color: AppColors.primaryFourElementText)),
          activeIcon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                  path: ImageRes.home, color: AppColors.primary_bg)),
          label: "Home"),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                path: ImageRes.search,
                color: AppColors.primaryFourElementText,
              )),
          activeIcon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                color: AppColors.primary_bg,
                path: ImageRes.search,
              )),
          label: "Search"),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                path: ImageRes.play,
                color: AppColors.primaryFourElementText,
              )),
          activeIcon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                  color: AppColors.primary_bg, path: ImageRes.play)),
          label: "Play"),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                path: ImageRes.message,
                color: AppColors.primaryFourElementText,
              )),
          activeIcon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                color: AppColors.primary_bg,
                path: ImageRes.message,
              )),
          label: "Message"),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                path: ImageRes.profilePhoto,
                color: AppColors.primaryFourElementText,
              )),
          activeIcon: SizedBox(
              height: size.height * 0.022,
              child: appImageWithColor(
                color: AppColors.primary_bg,
                path: ImageRes.profilePhoto,
              )),
          label: "Profile"),
    ];

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index: ref.watch(applicationNavNotifierProvider)),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: Container(
              height: size.height * 0.08,
              width: size.width * 1,
              //decoration: appBoxShadowWithRadius(),
              child: BottomNavigationBar(
                items: itemList,
                backgroundColor: Colors.white,
                elevation: 0.0,
                //type: BottomNavigationBarType.fixed,
                unselectedItemColor: AppColors.primaryFourElementText,
                selectedItemColor: AppColors.primary_bg,
                currentIndex: ref.watch(applicationNavNotifierProvider),
                onTap: (i) {
                  ref
                      .read(applicationNavNotifierProvider.notifier)
                      .changeIndex(i);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
