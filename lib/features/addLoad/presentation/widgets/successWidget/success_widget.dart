import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/presentation/pages/loads_screen.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../bottomNav/bottom_nav.dart';

Widget showSuccessDialog(BuildContext context) {
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppConstants.w * 0.055, // 20 / 360
      ),
    ),
    elevation: 10,
    child: Container(
      padding: EdgeInsets.all(
        AppConstants.w * 0.066, // 24 / 360
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppConstants.w * 0.055, // 20 / 360
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.1),
            blurRadius: AppConstants.w * 0.055, // 20 / 360
            offset: Offset(0, AppConstants.h * 0.012), // 10 / 776
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Success Icon with Gradient
          _build_scuccess_icon(),
          SizedBox(height: AppConstants.h * 0.025), // 20 / 776

          // Success Title
          _build_success_title(),
          SizedBox(height: AppConstants.h * 0.015), // 12 / 776

          // Success Message
          _build_success_message(),
          SizedBox(height: AppConstants.h * 0.038), // 30 / 776

          // Buttons Row
          _build_buttons(context),
        ],
      ),
    ),
  );
}
Widget _build_buttons(BuildContext context){
  return  Row(
    children: [
      // Post Another Button
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.h * 0.018, // 14 / 776
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.w * 0.033, // 12 / 360
              ),
            ),
          ),
          child: Text(
            LocaleKeys.Add_Load_close.tr(),
            style: TextStyle(
              fontSize: AppConstants.w * 0.032, // 14 / 360
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      SizedBox(width: AppConstants.w * 0.033), // 12 / 360

      // View My Loads Button
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>
                  BottomNav(
                    initialIndex: 1,
                  )),
                  (route) => false,
            );


          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.h * 0.018, // 14 / 776
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.w * 0.033, // 12 / 360
              ),
            ),
          ),
          child: Text(
            LocaleKeys.Add_Load_viewMyLoads.tr(),
            style: TextStyle(
              fontSize: AppConstants.w * 0.032, // 14 / 360
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}
Widget _build_success_message(){


  return         Text(
    LocaleKeys.Add_Load_loadPostedMessage.tr(),
    style: AppTextStyles.bodyMedium().copyWith(
      color: Colors.grey[600],
      fontSize: AppConstants.w * 0.038, // 14 / 360
      height: 1.5,
    ),
    textAlign: TextAlign.center,
  );
}
Widget _build_success_title(){
  return    Text(
    LocaleKeys.Add_Load_loadPosted.tr(),
    style: AppTextStyles.headlineSmall().copyWith(
      color: AppColors.primaryColor,
      fontSize: AppConstants.w * 0.055, // 20 / 360
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}
Widget _build_scuccess_icon(){
  return   Container(
    width: AppConstants.w * 0.277, // 100 / 360
    height: AppConstants.w * 0.277, // 100 / 360
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.primaryColor,
          AppColors.primaryVariant,
        ],
      ),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: AppColors.primaryColor.withOpacity(0.3),
          blurRadius: AppConstants.w * 0.044, // 16 / 360
          offset: Offset(0, AppConstants.h * 0.010), // 8 / 776
        ),
      ],
    ),
    child: Icon(
      Icons.check_circle_outline_rounded,
      color: Colors.white,
      size: AppConstants.w * 0.166, // 60 / 360
    ),
  );
}