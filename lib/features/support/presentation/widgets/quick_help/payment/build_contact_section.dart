import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/support/data/models/url_lanch_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';

Widget buildContactSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildSectionHeader(),
      SizedBox(height: AppConstants.h * 0.020), // 16 / 776

      _buildContactButton(
        icon: Icons.phone_rounded,
        label: LocaleKeys.Support_call_us.tr(),
        subtitle: '+201114324251',
        color: AppColors.infoColor,
        onTap: () => UrlLaunchModel.makePhoneCall('+201114324251'),
      ),
      SizedBox(height: AppConstants.h * 0.015), // 12 / 776

      _buildContactButton(
        icon: Icons.email_rounded,
        label: LocaleKeys.Support_emailSupport.tr(),
        subtitle: 'support@yourapp.com',
        color: AppColors.secondaryColor,
        onTap: () => UrlLaunchModel.sendEmail('support@yourapp.com'),
      ),
    ],
  );
}

Widget _buildSectionHeader() {
  return Row(
    children: [
      Icon(
        Icons.support_agent,
        color: AppColors.textSecondary,
        size: AppConstants.w * 0.055, // 20 / 360
      ),
      SizedBox(width: AppConstants.w * 0.022), // 8 / 360
      Text(
        LocaleKeys.Support_contact_support.tr(),
        style: TextStyle(
          fontSize: AppConstants.w * 0.044, // 16 / 360
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    ],
  );
}

Widget _buildContactButton({
  required IconData icon,
  required String label,
  required String subtitle,
  required Color color,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.w * 0.033), // 12 / 360
      child: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.044), // 16 / 360
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
          // 12 / 360
          border: Border.all(
            color: color.withOpacity(0.2),
            width: AppConstants.w * 0.003, // 1 / 360
          ),
        ),
        child: Row(
          children: [
            _buildIconCircle(icon, color),
            SizedBox(width: AppConstants.w * 0.044), // 16 / 360
            Expanded(child: _buildLabelAndSubtitle(label, subtitle)),
            Icon(
              Icons.arrow_forward_ios,
              size: AppConstants.w * 0.044, // 16 / 360
              color: color,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildIconCircle(IconData icon, Color color) {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.033), // 12 / 360
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      color: color,
      size: AppConstants.w * 0.066, // 24 / 360
    ),
  );
}

Widget _buildLabelAndSubtitle(String label, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: AppConstants.w * 0.041, // 15 / 360
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      SizedBox(height: AppConstants.h * 0.0025), // 2 / 776
      Text(
        subtitle,
        style: TextStyle(
          fontSize: AppConstants.w * 0.036, // 13 / 360
          color: AppColors.textSecondary,
        ),
      ),
    ],
  );
}
