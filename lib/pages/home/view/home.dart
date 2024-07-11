import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/image_widgets.dart';
import 'package:learnhub/common/widgets/search_widgets.dart';
import 'package:learnhub/pages/home/controller/home_controller.dart';
import 'package:learnhub/pages/home/view/widgets/home_widgets.dart';

import '../../application/provider/application_nav_notifier.dart';
import '../../search/controller/search_controller.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(size, ref),
      body: RefreshIndicator(
        onRefresh: () {
          return ref.read(homeCourseListProvider.notifier).fetchCourseList();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // we make special class for this because our did change dependcies changes
                // it rebuilds every thing and to avoid put that widget in stless and add const modifier here
                SizedBox(
                  height: size.height * 0.03,
                ),
                const HelloText(),
                const UserName(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // searchBar(
                //   searchFunc: (1) {
                //     ref
                //         .read(applicationNavNotifierProvider.notifier)
                //         .changeIndex();
                //   },
                // ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                HomeBanner(controller: _controller, ref: ref, size: size),
                const HomeMenuBar(),
                CourseItemGrid(
                  ref: ref,
                  size: size,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// CustomScrollView(
// physics: const ScrollPhysics(),
// shrinkWrap: true, // if you dont give height it will wrap
// slivers: [
// SliverPadding(
// padding: EdgeInsets.all(20),
// sliver: SliverGrid.count(
// crossAxisCount: 2,
// children: [
//
// ],
// ),
// ),
// ],
// ),
