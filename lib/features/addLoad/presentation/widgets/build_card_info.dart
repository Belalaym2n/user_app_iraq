import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/sharedWidgets/text_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

Widget buildCard({
  required String title,
  required IconData icon,
  bool isLoading = false,
  required List<Widget> children,
}) {
  return Container(
    padding: EdgeInsets.all(
      AppConstants.w * 0.044, // 16 / 360
    ),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(
        AppConstants.w * 0.033, // 12 / 360
      ),
      border: Border.all(color: AppColors.borderColor),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                AppConstants.w * 0.033, // 12 / 360
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isLoading ? Colors.white : AppColors.primaryColor,
                    isLoading ? Colors.white : AppColors.primaryLight
                  ],
                ),
                borderRadius: BorderRadius.circular(
                  AppConstants.w * 0.033, // 12 / 360
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: AppConstants.w * 0.066, // 24 / 360
              ),
            ),
            SizedBox(width: AppConstants.w * 0.022), // 8 / 360
            Text(
              title,
              style: AppTextStyles.headlineLarge().copyWith(
                fontWeight: FontWeight.w700,
                fontSize: AppConstants.w * 0.050, // 18 / 360
              ),
            ),
          ],
        ),
        SizedBox(height: AppConstants.h * 0.020), // 16 / 776
        ...children,
        SizedBox(
          height: AppConstants.h * 0.01, // Already responsive ✓
        )
      ],
    ),
  );
}