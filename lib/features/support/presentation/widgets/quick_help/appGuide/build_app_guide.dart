import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import 'build_app_guide_header.dart';
import 'build_quide_pages_view.dart';

class AppGuideDialog extends StatefulWidget {
  const AppGuideDialog({super.key});

  @override
  State<AppGuideDialog> createState() => _AppGuideDialogState();
}

class _AppGuideDialogState extends State<AppGuideDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.055, // 20 / 360
        vertical: AppConstants.h * 0.051,   // 40 / 776
      ),
      child: Container(
        height: AppConstants.h * 0.75, // 75% of screen height
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(AppConstants.w * 0.077), // 28 / 360
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.15),
              blurRadius: AppConstants.w * 0.083, // 30 / 360
              offset: Offset(
                0,
                AppConstants.h * 0.019, // 15 / 776
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            buildHeader(context),
            Expanded(
              child: BuildGuidePageView(),
            ),
          ],
        ),
      ),
    );
  }
}
