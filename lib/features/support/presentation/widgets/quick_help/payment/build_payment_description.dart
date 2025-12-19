import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:url_launcher/url_launcher.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

Widget buildPaymentDescription() {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.044), // 16 / 360
    decoration: _buildDescriptionDecoration(),
    child: Row(
      children: [
        _buildInfoIcon(),
        SizedBox(width: AppConstants.w * 0.033), // 12 / 360
        Expanded(child: _buildDescriptionText()),
      ],
    ),
  );
}

BoxDecoration _buildDescriptionDecoration() {
  return BoxDecoration(
    color: AppColors.infoColor.withOpacity(0.1),
    borderRadius: BorderRadius.circular(AppConstants.w * 0.033), // 12 / 360
    border: Border.all(
      color: AppColors.infoColor.withOpacity(0.2),
      width: AppConstants.w * 0.003, // 1 / 360
    ),
  );
}

Widget _buildInfoIcon() {
  return Icon(
    Icons.info_outline,
    color: AppColors.infoColor,
    size: AppConstants.w * 0.066, // 24 / 360
  );
}

Widget _buildDescriptionText() {
  return Text(
    LocaleKeys.Support_payment_description.tr(),
   // 'Having trouble with payment? Choose a method below to get instant help.',
    style: TextStyle(
      fontSize: AppConstants.w * 0.038, // 14 / 360
      color: AppColors.textPrimary,
      height: 1.4,
    ),
  );
}
