// states.dart
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:user_app_iraq/features/support/domain/entities/video_entity.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final VideoEntity videoEntity;
  VideoLoaded(this.videoEntity);
}

class VideoReady extends VideoState {
  final YoutubePlayerController controller;
  VideoReady(this.controller);
}

class VideoError extends VideoState {
  final String message;
  VideoError(this.message);
}