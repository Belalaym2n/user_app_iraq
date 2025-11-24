import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../generated/locale_keys.g.dart';

Widget build_login_header() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: AppConstants.w * 0.166, // 60 / 360
        height: AppConstants.w * 0.166, // 60 / 360
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            AppConstants.w * 0.044, // 16 / 360
          ),
        ),
        child: Icon(
          Icons.login,
          size: AppConstants.w * 0.083, // 30 / 360
          color: AppColors.primaryColor,
        ),
      ),

      SizedBox(
        height: AppConstants.h * 0.030, // 24 / 776
      ),

      Text(
     LocaleKeys.Login_welcome.tr(),
        style: AppTextStyles.headlineLarge().copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),

      SizedBox(
        height: AppConstants.h * 0.010, // 8 / 776
      ),

      Text(
        StringTranslateExtension(LocaleKeys.Login_continue_to_login).tr(),
        style:AppTextStyles
            .bodyLarge
          ().copyWith(color: Colors.grey[600]),
      ),
    ],
  );
}