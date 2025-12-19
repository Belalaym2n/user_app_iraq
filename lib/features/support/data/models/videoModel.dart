import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class VideoConstants {
  VideoConstants._();

  // Default video URLs
  static const String defaultInstructionVideoUrl =
      "https://youtu.be/iLLXfPwrtj0?si=n4eXpWWtfz0mWErK";

  // Video player configuration
  static const double defaultAspectRatio = 16 / 9;
  static const bool defaultAutoPlay = false;
  static const int controllerInitializationDelay = 500; // milliseconds

  // Error messages
  static   String invalidUrlError = LocaleKeys.Support_invalidUrlError.tr();
  static   String loadingFailedError = LocaleKeys.Support_loadingFailedError.tr(); //'Failed to load video';
  static   String unknownError =LocaleKeys.Support_unknownError.tr(); // 'Unknown error occurred';

  // UI Text
  static   String loadingText =LocaleKeys.Support_loadingText.tr();
  static   String retryButtonText =LocaleKeys.Support_retryButtonText.tr();
  static   String errorTitleText = 'Unable to Load Video';
}
