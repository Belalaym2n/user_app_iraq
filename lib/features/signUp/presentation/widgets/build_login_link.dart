import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../generated/locale_keys.g.dart';

Widget  buildLoginLink(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        LocaleKeys.register_already_have_account.tr(),
        style: AppTextStyles.bodyMedium(),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.login);
        },
        child: Text(
          LocaleKeys.register_login.tr(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppConstants.w * 0.04 , // 16 / 360
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
