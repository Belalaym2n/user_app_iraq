import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../generated/locale_keys.g.dart';

TextStyle get _titleStyle => TextStyle(
  fontSize: AppConstants.w * 0.056,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle get _descriptionStyle =>
    TextStyle(fontSize: AppConstants.w * 0.04, color: Colors.grey[600]);


Widget build_forget_pass_texts() {
  return Column(
    children: [
      _build_icon(),

      SizedBox(height: AppConstants.h * 0.02),
      _build_title(),
      SizedBox(height: AppConstants.h * 0.01),

      _build_subtitle(),
    ],
  );
}

Widget _build_icon() {
  return Center(
    child: Icon(
      Icons.lock_reset_rounded,
      size: AppConstants.w * 0.25,
      color: AppColors.primaryColor,
    ),
  );
}

Widget _build_title() {
  return Center(
    child: Text(LocaleKeys.forgetPassword_title.tr(), style: _titleStyle),
  );
}

Widget _build_subtitle() {
  return Center(
    child: Text(
      LocaleKeys.forgetPassword_subtitle.tr(),
      textAlign: TextAlign.center,
      style: _descriptionStyle,
    ),
  );
}
