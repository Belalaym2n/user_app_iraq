import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class JourneysEmpty extends StatefulWidget {
  JourneysEmpty({super.key});

  @override
  State<JourneysEmpty> createState() => _JourneysEmptyState();
}

class _JourneysEmptyState extends State<JourneysEmpty> {
  @override
  Widget build(BuildContext context) {
    return _buildEmptyState(context);
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.06,   // بدل 32
        vertical: AppConstants.h * 0.015,    // بدل 12
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.w * 0.05),
        elevation: 8,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppConstants.w * 0.05, // بدل 20
          ),
          padding: EdgeInsets.all(
            AppConstants.w * 0.08, // بدل 32
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(AppConstants.w * 0.055),
          ),
          child: Column(
            children: [
              _buildJourneyIcon(),
              SizedBox(height: AppConstants.h * 0.02), // بدل 16
              _buildNoJourneyYet(),
              SizedBox(height: AppConstants.h * 0.01), // بدل 8
              _buildNoJourneyDescription(),
              SizedBox(height: AppConstants.h * 0.03), // بدل 24
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJourneyIcon() {
    return Container(
      width: AppConstants.w * 0.22,  // بدل 90
      height: AppConstants.w * 0.22, // بدل 90
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.25),
          width: AppConstants.w * 0.005, // بدل 1.8
        ),
      ),
      child: Icon(
        Icons.local_shipping_outlined,
        size: AppConstants.w * 0.15, // بدل 64
        color: Colors.white,
      ),
    );
  }

  Widget _buildNoJourneyYet() {
    return Text(
      LocaleKeys.Home_no_journey_yet.tr(),
      style: AppTextStyles.titleLarge(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildNoJourneyDescription() {
    return Text(
      LocaleKeys.Home_start_journey.tr(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color:
        Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        fontSize: AppConstants.w * 0.035,
      ),
    );
  }
}
