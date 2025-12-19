import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_validator.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

Widget buildProblemTextField(TextEditingController problem) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppConstants.w * 0.044), // 16
      border: Border.all(
        color: AppColors.borderColor,
        width: AppConstants.w * 0.003, // 1
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.primaryColor.withOpacity(0.05),
          blurRadius: AppConstants.w * 0.027, // 10
          offset: Offset(0, AppConstants.h * 0.005), // 4
        ),
      ],
    ),
    child: TextFormField(
      validator: Validators.requiredField,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: problem,
      maxLines: 6,
      textInputAction: TextInputAction.newline,

      style: TextStyle(
        fontSize: AppConstants.w * 0.041, // 15
        color: AppColors.textPrimary,
        height: 1.5,
      ),

      decoration: InputDecoration(
        hintText: LocaleKeys.Problems_describe_problem_hint.tr(),

        hintStyle: TextStyle(
          fontSize: AppConstants.w * 0.038, // 14
          color: AppColors.textMuted,
          height: 1.5,
        ),

        prefixIcon: Padding(
          padding: EdgeInsets.all(AppConstants.w * 0.033), // 12
          child: Icon(
            Icons.description_outlined,
            color: AppColors.primaryColor,
            size: AppConstants.w * 0.061, // 22
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.044), // 16
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.044),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.044),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: AppConstants.w * 0.0055, // 2
          ),
        ),

        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(AppConstants.w * 0.044), // 16
      ),
    ),
  );
}
