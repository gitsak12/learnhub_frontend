import 'package:learnhub/common/models/lesson_entities.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/pages/lesson_detail/repo/lesson_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(LessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response = await LessonRepo.lessonList(params: lessonRequestEntity);
  if (response.code == 200) {
    // print(response.data![0].thumbnail);
    var url =
        '${AppConstants.IMAGE_UPLOAD_PATH}${response.data!.elementAt(0).url}';
    // print(url);
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    var initializeVideoPlayerFuture = videoPlayerController!.initialize();
    LessonVideo vidInstance = LessonVideo(
      url: url,
      isPlay: false,
      initializeVideoPlayer: initializeVideoPlayerFuture,
      lessonItem: response.data!,
    );

    ref
        .read(lessonDataControllerProvider.notifier)
        .updateLessonData(vidInstance);
  }

  return null;
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  //this can be used to check the newstate of our provider
  @override
  set state(AsyncValue<LessonVideo> newState) {
    //print('in setting new state');
    super.state = newState;
  }

  void updateLessonData(LessonVideo lesson) {
    update((data) => data.copyWith(
          url: lesson.url,
          initializeVideoPlayer: lesson.initializeVideoPlayer,
          lessonItem: lesson.lessonItem,
          isPlay: lesson.isPlay,
        ));
  }

  void playPause(bool isPlay) {
    update((data) => data.copyWith(
          isPlay: isPlay,
        ));
  }

  Future<void> playNextVid(String url) async {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }

    //as we have connected our future builder to data source
    //first we have to make it null
    update((data) => data.copyWith(
          isPlay: false,
          initializeVideoPlayer: null,
        ));

    //done with resource release

    //next start again
    var videoUrl = "${AppConstants.IMAGE_UPLOAD_PATH}${url}";
    print(videoUrl);
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    update((data) => data.copyWith(
          initializeVideoPlayer: initializeVideoPlayerFuture,
          isPlay: false,
          url: videoUrl,
        ));
  }
}
