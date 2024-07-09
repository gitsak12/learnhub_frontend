import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/models/lesson_entities.dart';
import '../../../../common/utils/app_constants.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/app_box_shadow.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../controller/lesson_controller.dart';

class lessonVideo extends StatelessWidget {
  final LessonVideo data;

  const lessonVideo({
    super.key,
    required this.size,
    required this.data,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  '${AppConstants.IMAGE_UPLOAD_PATH}${data.lessonItem[0].thumbnail}'))),
      width: size.width * 1,
      height: size.height * 0.27,
      //color: Colors.red,
      child: FutureBuilder(
        future: data.initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return videoPlayerController == null
                ? Container(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: VideoPlayer(videoPlayerController!))
                    ],
                  );
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}

class VideoPlayPause extends StatelessWidget {
  const VideoPlayPause({
    super.key,
    required this.size,
    required this.ref,
    required this.data,
  });

  final LessonVideo data;
  final Size size;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Duration currentPosition = videoPlayerController!.value.position;
              Duration targetPosition = currentPosition - Duration(seconds: 2);
              videoPlayerController!.seekTo(targetPosition);
            },
            child: Container(
              width: size.width * 0.06,
              height: size.height * 0.03,
              child: Image.asset(ImageRes.left),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (data.isPlay) {
                videoPlayerController!.pause();
                ref
                    .read(lessonDataControllerProvider.notifier)
                    .playPause(!(data.isPlay));
              } else {
                print('play');
                videoPlayerController!.play();
                ref
                    .read(lessonDataControllerProvider.notifier)
                    .playPause(!(data.isPlay));
              }
            },
            child: Container(
              width: size.width * 0.06,
              height: size.height * 0.03,
              child: data.isPlay
                  ? Image.asset(ImageRes.pause)
                  : Image.asset(ImageRes.play),
            ),
          ),
          GestureDetector(
            onTap: () {
              Duration currentPosition = videoPlayerController!.value.position;
              Duration targetPosition = currentPosition + Duration(seconds: 2);
              videoPlayerController!.seekTo(targetPosition);
            },
            child: Container(
              width: size.width * 0.06,
              height: size.height * 0.03,
              child: Image.asset(ImageRes.right),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessonData;
  final Size size;
  final WidgetRef ref;

  const LessonVideos(
      {super.key,
      required this.lessonData,
      required this.size,
      required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        itemCount: lessonData.length,
        itemBuilder: (_, i) {
          return InkWell(
            onTap: () {
              var vidUrl = lessonData[i].url;
              print(vidUrl);
              ref
                  .read(lessonDataControllerProvider.notifier)
                  .playNextVid(vidUrl!);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              width: size.width * 0.9,
              height: size.height * 0.08,
              decoration: appBoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  //color: Colors.red,
                  radius: 10,
                  spread: 5,
                  blur: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.04),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            '${AppConstants.IMAGE_UPLOAD_PATH}${lessonData[i].thumbnail}')),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text24Normal(
                            line: lessonData[i].name!,
                            fontsize: 18,
                            fontweight: FontWeight.bold),
                        // text24Normal(
                        //   textoverflow: TextOverflow.ellipsis,
                        //   line: lessonData[i].description!,
                        //   fontsize: 12,
                        //   color: Colors.grey.shade600,
                        // ),
                      ],
                    ),
                  ),
                  // Expanded(child: Container()),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.08,
                    child: Image.asset(ImageRes.arrowRight),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
