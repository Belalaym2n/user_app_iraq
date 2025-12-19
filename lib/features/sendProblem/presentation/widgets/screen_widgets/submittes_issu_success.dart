import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

void problemSentSuccessfully(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.066), // 24
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.w * 0.055), // 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(AppConstants.w * 0.044), // 16
              decoration: BoxDecoration(
                color: AppColors.successColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: AppConstants.w * 0.166, // 60
                color: AppColors.successColor,
              ),
            ),

            SizedBox(height: AppConstants.h * 0.020), // 16

            Text(
              LocaleKeys.Problems_report_submitted.tr(),
              style: TextStyle(
                fontSize: AppConstants.w * 0.061, // 22
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: AppConstants.h * 0.010), // 8

            Text(
              LocaleKeys.Problems_we_will_get_back_24_hours.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppConstants.w * 0.038, // 14
                color: AppColors.textSecondary,
              ),
            ),

            SizedBox(height: AppConstants.h * 0.031), // 24

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.w * 0.088, // 32
                  vertical: AppConstants.h * 0.018, // 14
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.w * 0.033,
                  ), // 12
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: AppConstants.w * 0.044, // 16
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
