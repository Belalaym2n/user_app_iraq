import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/support/presentation/widgets/youtubeVideo/load_player.dart';
import 'package:user_app_iraq/features/support/presentation/widgets/youtubeVideo/video_error.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/videoModel.dart';
import 'build_enum.dart';

class InstructionsVideo extends StatefulWidget {
  final String? videoUrl;
  final bool autoPlay;
  final double aspectRatio;

  const InstructionsVideo({
    super.key,
    this.videoUrl,
    this.autoPlay = false,
    this.aspectRatio = 16 / 9,
  });

  @override
  State<InstructionsVideo> createState() => _InstructionsVideoState();
}

class _InstructionsVideoState extends State<InstructionsVideo> {
  late YoutubePlayerController _controller;
  VideoPlayerState _playerState = VideoPlayerState.loading;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      final videoUrl =
          widget.videoUrl ?? VideoConstants.defaultInstructionVideoUrl;
      final videoId = _extractVideoId(videoUrl);

      if (videoId == null) {
        throw VideoPlayerException(VideoConstants.invalidUrlError);
      }

      _controller = _createController(videoId);
      await _waitForControllerReady();

      if (mounted) {
        setState(() => _playerState = VideoPlayerState.ready);
      }
    } on VideoPlayerException catch (e) {
      _handleError(e.message);
    } catch (e) {
      _handleError('${VideoConstants.loadingFailedError}: ${e.toString()}');
    }
  }

  String? _extractVideoId(String url) {
    try {
      return YoutubePlayerController.convertUrlToId(url);
    } catch (e) {
      return null;
    }
  }

  YoutubePlayerController _createController(String videoId) {
    return YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: widget.autoPlay,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
        loop: false,
        enableJavaScript: true,
        origin: 'https://www.youtube-nocookie.com',
        enableCaption: true,
        strictRelatedVideos: true,
      ),
    );
  }

  Future<void> _waitForControllerReady() async {
    await Future.delayed(
      Duration(milliseconds: VideoConstants.controllerInitializationDelay),
    );
  }

  void _handleError(String message) {
    if (mounted) {
      setState(() {
        _playerState = VideoPlayerState.error;
        _errorMessage = message;
      });
    }
  }

  void _retryLoading() {
    setState(() {
      _playerState = VideoPlayerState.loading;
      _errorMessage = null;
    });
    _initializePlayer();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.w,
      decoration: _buildContainerDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _buildPlayerContent(),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildPlayerContent() {
    switch (_playerState) {
      case VideoPlayerState.loading:
        return VideoLoadingWidget(height: AppConstants.h * 0.3);
      case VideoPlayerState.error:
        return VideoErrorWidget(
          errorMessage: _errorMessage ?? VideoConstants.unknownError,
          onRetry: _retryLoading,
          height: AppConstants.h * 0.3,
        );
      case VideoPlayerState.ready:
        return _buildPlayer();
    }
  }

  Widget _buildPlayer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: YoutubePlayer(
        controller: _controller,
        aspectRatio: widget.aspectRatio,
      ),
    );
  }
}

