import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

Widget buildHeader(BuildContext context) {
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
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.Support_app_guide.tr()
        ,
              style: TextStyle(
                fontSize: AppConstants.w * 0.066, // 24 / 360
                fontWeight: FontWeight.bold,
                color: Colors.white,
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

        SizedBox(height: AppConstants.h * 0.010), // 8 / 776

        Text(
          LocaleKeys.Support_learn_how_to_use_app.tr() ,
          style: TextStyle(
            fontSize: AppConstants.w * 0.039, // 14 / 360
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    ),
  );
}
