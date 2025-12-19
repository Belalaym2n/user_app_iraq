import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/support/data/models/url_lanch_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';

Widget buildPaymentFooter(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(AppConstants.w * 0.066), // 24 / 360
    decoration: BoxDecoration(
      color: AppColors.neutralGray,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(AppConstants.w * 0.066), // 24 / 360
        bottomRight: Radius.circular(AppConstants.w * 0.066), // 24 / 360
      ),
    ),
    child: Row(
      children: [
        _build_close_button(context),
        SizedBox(width: AppConstants.w * 0.033), // 12 / 360
        _build_chat_button(context),
      ],
    ),
  );
}

Widget _build_close_button(BuildContext context) {
  return Expanded(
    child: OutlinedButton(
      onPressed: () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.h * 0.020, // 16 / 776
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.033), // 12 / 360
        ),
        side: const BorderSide(color: AppColors.primaryColor),
      ),
      child: Text(
        LocaleKeys.Support_close.tr(),
        style: TextStyle(
          fontSize: AppConstants.w * 0.044, // 16 / 360
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );
}

Widget _build_chat_button(BuildContext context) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        UrlLaunchModel.openWhatsApp('+9647701234567');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.h * 0.020, // 16 / 776
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.033), // 12 / 360
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble,
            size: AppConstants.w * 0.050, // 18 / 360
            color: Colors.white,
          ),
          SizedBox(width: AppConstants.w * 0.022), // 8 / 360
          Text(
            LocaleKeys.Support_chat_now.tr()
 ,
            style: TextStyle(
              fontSize: AppConstants.w * 0.044, // 16 / 360
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
