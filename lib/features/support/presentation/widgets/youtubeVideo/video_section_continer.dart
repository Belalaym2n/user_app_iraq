import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/support/presentation/widgets/youtubeVideo/youtube_video.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

class VideoSectionContainer extends StatelessWidget {
  final String? videoUrl;
  final String? customTitle;
  final String? customDescription;

  const VideoSectionContainer({
    super.key,
    this.videoUrl,
    this.customTitle,
    this.customDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildContainerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context),
          SizedBox(height: AppConstants.h * 0.020), // 16 / 776
          _buildVideoPlayer(),
          if (customDescription != null) ...[
            SizedBox(height: AppConstants.h * 0.015), // 12 / 776
            _buildDescription(),
          ],
          SizedBox(height: AppConstants.h * 0.020), // 16 / 776
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppConstants.w * 0.044), // 16 / 360
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: AppConstants.w * 0.033, // 12 / 360
          offset: Offset(0, AppConstants.h * 0.005), // 4 / 776
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.w * 0.044, // 16 / 360
        AppConstants.w * 0.044, // 16 / 360
        AppConstants.w * 0.044, // 16 / 360
        0,
      ),
      child: Row(
        children: [
          _buildIconContainer(),
          SizedBox(width: AppConstants.w * 0.033), // 12 / 360
          Expanded(child: _buildTitle(context)),
        ],
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: EdgeInsets.all(AppConstants.w * 0.027), // 10 / 360
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.15),
            AppColors.primaryColor.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.033), // 12 / 360
      ),
      child: Icon(
        Icons.play_circle_fill,
        color: AppColors.primaryColor,
        size: AppConstants.w * 0.072, // 26 / 360
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      customTitle!,
      style: TextStyle(
        fontSize: AppConstants.w * 0.050, // 18 / 360
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.044, // 16 / 360
      ),
      child: InstructionsVideo(
        videoUrl: videoUrl,
        autoPlay: false,
        aspectRatio: 16 / 9,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.044, // 16 / 360
      ),
      child: Text(
        customDescription!,
        style: TextStyle(
          fontSize: AppConstants.w * 0.038, // 14 / 360
          color: Colors.grey[600],
          height: 1.5,
        ),
      ),
    );
  }
}
