import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';

Widget build_sign_up_header(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Icon Container
      _build_header_icon(context),
      const SizedBox(height: 16),

      _build_header_headline(context),

      const SizedBox(height: 5),

      _build_header_description(context),
    ],
  );
}

Widget _build_header_description(BuildContext context) {
  return Text(
    LocaleKeys.register_enter_details.tr(),
    style: AppTextStyles.bodyLarge().copyWith(color: Colors.grey[600]),
  );
}

Widget _build_header_headline(BuildContext context) {
  return Text(
    LocaleKeys.register_create_account.tr(),
    style:AppTextStyles.headlineLarge().copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}

Widget _build_header_icon(BuildContext context) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(Icons.person_add, size: 30, color: AppColors.primaryColor),
  );
}
