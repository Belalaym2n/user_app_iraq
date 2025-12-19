import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import 'build_payment_description.dart';
import 'build_payment_header.dart';

Widget buildPaymentMethods() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(
            Icons.credit_card,
            color: AppColors.textSecondary,
            size: AppConstants.w * 0.055, // 20 / 360
          ),
          SizedBox(width: AppConstants.w * 0.022), // 8 / 360
          Text(
            LocaleKeys.Support_accepted_payment_methods.tr()
         ,
            style: TextStyle(
              fontSize: AppConstants.w * 0.044, // 16 / 360
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),

      SizedBox(height: AppConstants.h * 0.020), // 16 / 776

      Wrap(
        spacing: AppConstants.w * 0.033, // 12 / 360
        runSpacing: AppConstants.w * 0.033, // 12 / 360
        children: [
          _buildPaymentChip(Icons.credit_card,LocaleKeys.Support_credit_card.tr() ),
          _buildPaymentChip(Icons.account_balance, LocaleKeys.Support_cash.tr()  ),
        ],
      ),
    ],
  );
}

Widget _buildPaymentChip(IconData icon, String label) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppConstants.w * 0.044, // 16 / 360
      vertical: AppConstants.h * 0.012,   // 10 / 776
    ),
    decoration: BoxDecoration(
      color: AppColors.successColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppConstants.w * 0.055), // 20 / 360
      border: Border.all(
        color: AppColors.successColor.withOpacity(0.3),
        width: AppConstants.w * 0.003, // 1 / 360
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: AppConstants.w * 0.050, // 18 / 360
          color: AppColors.successColor,
        ),

        SizedBox(width: AppConstants.w * 0.022), // 8 / 360

        Text(
          label,
          style: TextStyle(
            fontSize: AppConstants.w * 0.036, // 13 / 360
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    ),
  );
}
