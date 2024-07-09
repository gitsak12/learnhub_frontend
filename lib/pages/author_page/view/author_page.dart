import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/button_widgets.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/author_page/controller/author_controller.dart';
import 'package:learnhub/pages/author_page/view/widgets/author_widgets.dart';

class AuthorPage extends ConsumerStatefulWidget {
  const AuthorPage({super.key});

  @override
  ConsumerState<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends ConsumerState<AuthorPage> {
  late final args;

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as Map;
    ref.watch(authorCourseListControllerProvider.notifier).init(args['token']);
    // TODO: implement didChangeDependencies
    print(args['token']);
    //author data
    ref.watch(courseAuthorControllerProvider.notifier).init(args['token']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var authorInfo = ref.watch(courseAuthorControllerProvider);
    var authorCourses  = ref.watch(authorCourseListControllerProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: text24Normal(
              line: 'Author', fontweight: FontWeight.bold, fontsize: 17),
        ),
        body: switch (authorInfo) {
          AsyncData(:final value) => value == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Column(
                    children: [
                      AuthorPageCoverPhotoAndName(authorInfo: value,),
                      AuthorDescription(authorItem: value,),
                      appButton(
                          size: size,
                          buttonName: 'Chat with Instructor',
                          isLoginButton: true,
                          context: context),
                      AuthorCoursesList(courseData: authorCourses.value!),
                    ],
                  ),
                ),
          AsyncError(:final error) => Text('Error $error'),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        });
  }
}
