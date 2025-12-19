import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/videoModel.dart';

class VideoLoadingWidget extends StatelessWidget {
  final double height;

  const VideoLoadingWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor.withOpacity(0.1),
            AppColors.primaryColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.044), // 16 / 360
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoadingIndicator(),
            SizedBox(height: AppConstants.h * 0.020), // 16 / 776
            _buildLoadingText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer circle animation
        SizedBox(
          width: AppConstants.w * 0.222, // 80 / 360
          height: AppConstants.w * 0.222, // 80 / 360
          child: CircularProgressIndicator(
            strokeWidth: AppConstants.w * 0.0083, // 3 / 360
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.primaryColor.withOpacity(0.3),
            ),
          ),
        ),

        // Inner icon container
        Container(
          width: AppConstants.w * 0.166, // 60 / 360
          height: AppConstants.w * 0.166, // 60 / 360
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.2),
                blurRadius: AppConstants.w * 0.022, // 8 / 360
                offset: Offset(0, AppConstants.h * 0.0025), // 2 / 776
              ),
            ],
          ),
          child: Icon(
            Icons.play_circle_outline,
            size: AppConstants.w * 0.088, // 32 / 360
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingText() {
    return Text(
      VideoConstants.loadingText,
      style: TextStyle(
        fontSize: AppConstants.w * 0.039, // 14 / 360
        color: Colors.grey[600],
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
