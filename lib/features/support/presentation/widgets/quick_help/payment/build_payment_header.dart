import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

Widget buildPaymentHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.066), // 24 / 360
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.w * 0.066), // 24 / 360
        topRight: Radius.circular(AppConstants.w * 0.066), // 24 / 360
      ),
    ),
    child: Row(
      children: [
        build_payment_icon(),
        SizedBox(width: AppConstants.w * 0.044), // 16 / 360
        _build_payment_help(),
        _build_icon_close(context),
      ],
    ),
  );
}

Widget _build_icon_close(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(
      Icons.close,
      color: Colors.white,
      size:
          AppConstants.w *
          0.055, // 20 / 360 (default icon size ~ 24 → 20 is balanced)
    ),
  );
}

Widget build_payment_icon() {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.033), // 12 / 360
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.payment_rounded,
      color: Colors.white,
      size: AppConstants.w * 0.077, // 28 / 360
    ),
  );
}

Widget _build_payment_help() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.Support_payment_help.tr(),
          style: TextStyle(
            fontSize: AppConstants.w * 0.061, // 22 / 360
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: AppConstants.h * 0.005), // 4 / 776
        Text(
          LocaleKeys.Support_we_are_here_to_assist_you.tr(),

          style: TextStyle(
            fontSize: AppConstants.w * 0.038, // 14 / 360
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    ),
  );
}
