import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/models/course_entities.dart';
import 'package:learnhub/common/widgets/app_bar.dart';
import 'package:learnhub/pages/search/view/widgets/search_widgets.dart';
import '../../../common/routes/app_routes_names.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/app_constants.dart';
import '../../../common/widgets/text_widgets.dart';
import '../controller/search_controller.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    final searchProvider = ref.watch(coursesSearchControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(line: 'Search Courses'),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoursesSearchBar(
                func: null,
                searchFunc: (search) {
                  ref
                      .watch(coursesSearchControllerProvider.notifier)
                      .searchData(search);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                height: MediaQuery.of(context).size.height,
                child: switch (searchProvider) {
                  AsyncData(:final value) => value!.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (_, index) {
                            return Container(
                              width: size.width * 0.1,
                              height: size.height * 0.1,
                              //0.1
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.02),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.red,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: const Offset(0, 1))
                                  ]),
                              child: InkWell(
                                onTap: () => Navigator.of(context).pushNamed(
                                    AppRoutesNames.COURSE_DETAIL,
                                    arguments: {
                                      "id": value.elementAt(index).id
                                    }),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.1,
                                          width: size.width * 0.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: NetworkImage(
                                                      "${AppConstants.IMAGE_UPLOAD_PATH}${value.elementAt(index).thumbnail}"))),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 6),
                                              width: 180,
                                              child: text24Normal(
                                                fontsize: 18,
                                                maxLines: 1,
                                                color: AppColors.primaryText,
                                                fontweight: FontWeight.bold,
                                                line: value
                                                    .elementAt(index)
                                                    .name
                                                    .toString(),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 6),
                                              width: 180,
                                              child: text24Normal(
                                                fontsize: 12,
                                                color: AppColors
                                                    .primaryThreeElementText,
                                                line:
                                                    "${value.elementAt(index).lesson_num} Lesson",
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                  AsyncError(:final error) => Text('Error $error'),
                  _ => const Center(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            strokeWidth: 2,
                          )))
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
