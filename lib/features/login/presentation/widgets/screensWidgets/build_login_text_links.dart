
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../../config/routes/app_router.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../generated/locale_keys.g.dart';
Widget  buildForgotPasswordButton(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.forgetPassword);
      },
      child: Text(
        StringTranslateExtension(LocaleKeys.Login_forget_password).tr(),
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
Widget  buildRegisterLink(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        StringTranslateExtension(LocaleKeys.Login_dont_have_account).tr(),
        style: AppTextStyles.bodyMedium( ),
      ),
      SizedBox(width: AppConstants.w*0.0,),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.signUp);
        },
        child: Text(
          StringTranslateExtension(LocaleKeys.Login_sign_up).tr(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: AppConstants.w*0.04
          ),
        ),
      ),
    ],
  );
}
