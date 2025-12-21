import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

class NoBidsWidget extends StatelessWidget {
  const NoBidsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon container with subtle background
              Container(
                width: AppConstants.w * 0.28,
                height: AppConstants.w * 0.28,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.06),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.gavel_outlined,
                    size: AppConstants.w * 0.15,
                    color: AppColors.primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: AppConstants.h * 0.03),

              // Headline
              Text(
                "No Bids Yet",
                style: AppTextStyles.headlineSmall().copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: AppConstants.h * 0.01),

              // Subtitle
              Text(
                "Bids will appear here once drivers\nstart responding to your load",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textMuted,
                  height: 1.5,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),

    );
  }
}