import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/complaint/presentation/widgets/widgetItems/section_header.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../common/build_card_continer.dart';

class BuildPrivacy extends StatelessWidget {
  BuildPrivacy({super.key,required this.isAnonymous,required this.changePrivacy});
  bool  isAnonymous ;
  final ValueChanged<bool> changePrivacy;



  Widget build(BuildContext context) {
    return   _buildPrivacySection();
  }



Widget _buildPrivacySection() {
  return CardContainer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.shield_outlined,
          title: 'Privacy Settings',
          subtitle: 'Control your identity visibility',
        ),
        SizedBox(height: AppConstants.h * 0.02),
        _buildAnonymousToggle(),
        if (isAnonymous) ...[
          SizedBox(height: AppConstants.h * 0.02),
          _buildInfoBox(),
        ],
      ],
    ),
  );
}

Widget _buildAnonymousToggle() {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.035),
    decoration: BoxDecoration(
      color: AppColors.neutralGray,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.borderColor),
    ),
    child: Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.all(AppConstants.w * 0.028),
          decoration: BoxDecoration(
            color: isAnonymous
                ? AppColors.primaryColor.withOpacity(0.15)
                : AppColors.borderColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.fingerprint,
            color: isAnonymous
                ? AppColors.primaryColor
                : AppColors.textMuted,
            size: AppConstants.w * 0.065,
          ),
        ),
        SizedBox(width: AppConstants.w * 0.035),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Submit Anonymously',
                style: AppTextStyles.headlineSmall().copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppConstants.h * 0.004),
              Text(
                'Your identity will remain confidential',
                style: AppTextStyles.bodySmall().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: isAnonymous,
          onChanged: (value) => changePrivacy(value),
          activeColor: AppColors.primaryColor,
          activeTrackColor: AppColors.primaryColor.withOpacity(0.3),
        ),
      ],
    ),
  );
}

Widget _buildInfoBox() {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.035),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.infoColor.withOpacity(0.1),
          AppColors.infoColor.withOpacity(0.05),
        ],
      ),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: AppColors.infoColor.withOpacity(0.3),
        width: 1.5,
      ),
    ),
    child: Row(
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: AppColors.infoColor,
          size: AppConstants.w * 0.055,
        ),
        SizedBox(width: AppConstants.w * 0.025),
        Expanded(
          child: Text(
            'Your complaint will be submitted without revealing your personal information to ensure complete privacy',
            style: AppTextStyles.bodySmall().copyWith(
              color: AppColors.infoColor,
              height: 1.4,
            ),
          ),
        ),
      ],
    ),
  );
}}