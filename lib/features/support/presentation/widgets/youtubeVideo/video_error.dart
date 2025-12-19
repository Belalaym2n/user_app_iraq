import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/videoModel.dart';

class VideoErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final double height;

  const VideoErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.044), // 16 / 360
        border: Border.all(
          color: Colors.red.withOpacity(0.2),
          width: AppConstants.w * 0.0027, // 1 / 360
        ),
      ),

      padding: EdgeInsets.all(AppConstants.w * 0.066), // 24 / 360

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildErrorIcon(),
            SizedBox(height: AppConstants.h * 0.020), // 16 / 776
            _buildErrorTitle(),
            SizedBox(height: AppConstants.h * 0.010), // 8 / 776
            _buildErrorMessage(),
            SizedBox(height: AppConstants.h * 0.030), // 24 / 776
            _buildRetryButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Container(
      width: AppConstants.w * 0.166, // 60 / 360
      height: AppConstants.w * 0.166, // 60 / 360
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.error_outline,
        size: AppConstants.w * 0.088, // 32 / 360
        color: Colors.red,
      ),
    );
  }

  Widget _buildErrorTitle() {
    return Text(
      VideoConstants.errorTitleText,
      style: TextStyle(
        fontSize: AppConstants.w * 0.044, // 16 / 360
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildErrorMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.044, // 16 / 360
      ),
      child: Text(
        errorMessage,
        style: TextStyle(
          fontSize: AppConstants.w * 0.036, // 13 / 360
          color: Colors.grey[600],
        ),
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildRetryButton() {
    return ElevatedButton.icon(
      onPressed: onRetry,
      icon: Icon(
        Icons.refresh,
        size: AppConstants.w * 0.050, // 18 / 360
      ),
      label: Text(
        VideoConstants.retryButtonText,
        style: TextStyle(
          fontSize: AppConstants.w * 0.044, // 16 / 360
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.w * 0.066, // 24 / 360
          vertical: AppConstants.h * 0.015, // 12 / 776
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.022), // 8 / 360
        ),
        elevation: 2,
      ),
    );
  }
}
