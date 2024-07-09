import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/models/lesson_entities.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/app_bar.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/pages/lesson_detail/controller/lesson_controller.dart';
import 'package:learnhub/pages/lesson_detail/view/widgets/lesson_widegts.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late final args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)?.settings.arguments as Map;
    args = id['id'];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lessonData = ref.watch(lessonDataControllerProvider);
    //print('--- ${lessonData.value!.lessonItem.length}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(line: 'Lesson'),
      body: lessonData.when(
          data: (data) {
            return lessonData.value!.lessonItem.isEmpty
                ? Container(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        lessonVideo(
                          size: size,
                          data: data,
                        ),
                        SizedBox(
                          height: size.height * 0.002,
                        ),
                        VideoPlayPause(
                          size: size,
                          ref: ref,
                          data: data,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        LessonVideos(lessonData: data.lessonItem, size: size, ref: ref,),
                      ],
                    ));
          },
          error: (e, trace) => Text(e.toString()),
          loading: () => Text('loading')),
    );
  }
}
