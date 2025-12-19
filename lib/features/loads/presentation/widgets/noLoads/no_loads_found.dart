import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class NoLoadsFound extends StatefulWidget {
  const NoLoadsFound({super.key});

  @override
  State<NoLoadsFound> createState() => _NoLoadsFoundState();
}

class _NoLoadsFoundState extends State<NoLoadsFound> {
  @override
  Widget build(BuildContext context) {
    return _buildEnhancedEmptyState();
  }

  Widget _buildEnhancedEmptyState() {
    return Container(
      padding: EdgeInsets.all(
        AppConstants.w * 0.1111, // بدل 40
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLoadIcon(),
          SizedBox(height: AppConstants.h * 0.03),   // بدل 24
          _buildHeadline(),
          SizedBox(height: AppConstants.h * 0.015),  // بدل 12
          _buildDescription(),
          SizedBox(height: AppConstants.h * 0.04),   // بدل 32
          _buildActionButton(),
        ],
      ),
    );
  }

  /// -------------------------------
  /// 🔵 Icon Widget
  /// -------------------------------
  Widget _buildLoadIcon() {
    return Container(
      width: AppConstants.w * 0.3333,  // بدل 120
      height: AppConstants.h * 0.15,   // بدل 120
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.15),
            AppColors.primaryLight.withOpacity(0.08),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.inventory_2_rounded,
        size: AppConstants.w * 0.1666, // بدل 60
        color: AppColors.primaryColor.withOpacity(0.7),
      ),
    );
  }

  Widget _buildHeadline() {
    return Text(
      LocaleKeys.Loads_no_loads_found.tr(),
      style: AppTextStyles.headlineSmall(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription() {
    return Text(
      LocaleKeys.Loads_start_posting_first_load.tr(),
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyMedium(),
    );
  }

  Widget _buildActionButton() {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.add_load);
      },
      icon: const Icon(Icons.add_rounded),
      label: Text(LocaleKeys.Home_post_load.tr()),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.w * 0.0666, // بدل 24
          vertical: AppConstants.h * 0.02,     // بدل 16
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppConstants.w * 0.0444, // بدل 16
          ),
        ),
      ),
    );
  }
}
