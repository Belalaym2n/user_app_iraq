import 'package:flutter/material.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_colors.dart';

class NoAdsWidget extends StatelessWidget {
  const NoAdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.h * 0.22,
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.044,
        vertical: AppConstants.h * 0.015,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.05),
            AppColors.primaryColor.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_off_outlined,
              size: 40,
              color: AppColors.primaryColor.withOpacity(0.6),
            ),
          ),

          SizedBox(height: AppConstants.h * 0.015),

          // Title
          Text(
            'No Ads Available',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: AppConstants.h * 0.006),

          // Subtitle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.1),
            child: Text(
              'Check back later for exciting offers',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
