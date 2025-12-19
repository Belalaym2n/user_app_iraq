enum VideoPlayerState { loading, ready, error }

class VideoPlayerException implements Exception {
  final String message;
  VideoPlayerException(this.message);

  @override
  String toString() => message;
}

