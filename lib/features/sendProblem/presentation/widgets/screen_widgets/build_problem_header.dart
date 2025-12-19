import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

Widget build_problem_header() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(AppConstants.w * 0.083),  // = 30
        bottomRight: Radius.circular(AppConstants.w * 0.083), // = 30
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: AppConstants.h * 0.026), // = 20

        Container(
          padding: EdgeInsets.all(AppConstants.w * 0.055), // = 20
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.report_problem_outlined,
            size: AppConstants.w * 0.166, // = 60
            color: Colors.white,
          ),
        ),

        SizedBox(height: AppConstants.h * 0.021), // = 16

        Text(
          LocaleKeys.Problems_we_are_here_to_help.tr(),
          style: TextStyle(
            fontSize: AppConstants.w * 0.066, // = 24
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: AppConstants.h * 0.010), // = 8

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w * 0.111, // = 40
          ),
          child: Text(
            LocaleKeys.Problems_describe_your_issue.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppConstants.w * 0.038, // = 14
              color: Colors.white.withOpacity(0.9),
              height: 1.4,
            ),
          ),
        ),

        SizedBox(height: AppConstants.h * 0.038), // = 30
      ],
    ),
  );
}
