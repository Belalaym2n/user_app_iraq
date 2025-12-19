import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../data/models/build_faq_questions.dart';

Widget buildFAQHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(
      AppConstants.w * 0.066, // 24 / 360
    ),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.w * 0.077), // 28 / 360
        topRight: Radius.circular(AppConstants.w * 0.077), // 28 / 360
      ),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(
            AppConstants.w * 0.033, // 12 / 360
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.quiz_outlined,
            color: Colors.white,
            size: AppConstants.w * 0.077, // 28 / 360
          ),
        ),

        SizedBox(width: AppConstants.w * 0.044), // 16 / 360

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Support_frequentlyAskedQuestions.tr(),
                style: TextStyle(
                  fontSize: AppConstants.w * 0.055, // 20 / 360
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: AppConstants.h * 0.005), // 4 / 776

              Text(
                LocaleKeys.Support_findAnswersToCommonQuestions.tr(),
                style: TextStyle(
                  fontSize: AppConstants.w * 0.036, // 13 / 360
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: EdgeInsets.all(
              AppConstants.w * 0.016, // 6 / 360
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                AppConstants.w * 0.022, // 8 / 360
              ),
            ),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: AppConstants.w * 0.055, // 20 / 360
            ),
          ),
        ),
      ],
    ),
  );
}
