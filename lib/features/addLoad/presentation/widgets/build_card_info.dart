import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/sharedWidgets/text_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

Widget  buildCard({
  required String title,
  required IconData icon,
  required List<Widget> children,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.borderColor),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.primaryLight],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
             const SizedBox(width: 8),
            Text(title, style: AppTextStyles.headlineLarge().copyWith(
              fontWeight: FontWeight.w700,
               fontSize: 18
            )),
          ],
        ),
        const SizedBox(height: 16),
        ...children,
        SizedBox(
          height: AppConstants.h*0.01,
        )
      ],
    ),
  );
}