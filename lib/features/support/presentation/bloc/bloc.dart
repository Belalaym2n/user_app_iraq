import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/support/domain/entities/video_entity.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
 import 'events.dart';
import 'states.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial()) {
    on<LoadVideoEvent>((event, emit) async {
      emit(VideoLoading());
      try {
        await Future.delayed(Duration(seconds: 1));

        final videoEntity = VideoEntity(
          url: "https://youtu.be/iLLXfPwrtj0?si=n4eXpWWtfz0mWErK",
        );
        emit(VideoLoaded(videoEntity));

        // استخراج video ID من الرابط
        final videoId = YoutubePlayerController.convertUrlToId(videoEntity.url);

        if (videoId == null) {
          throw Exception("Invalid YouTube URL");
        }

        final controller = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: true,
          params: YoutubePlayerParams(
            enableJavaScript: true,
            origin: 'https://www.youtube-nocookie.com',
            mute: false,
            loop: true,
            showControls: true,
            showFullscreenButton: true,
          ),
        );

        emit(VideoReady(controller));
      } catch (e) {
        emit(VideoError(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    if (state is VideoReady) {
      (state as VideoReady).controller.close();
    }
    return super.close();
  }
}