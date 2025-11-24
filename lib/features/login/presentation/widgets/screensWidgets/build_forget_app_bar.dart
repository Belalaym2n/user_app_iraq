import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';

AppBar  build_foget_password_AppBar(BuildContext context) {
  return AppBar(
    title: Text(
      LocaleKeys.forgetPassword_title.tr(),
      style: const TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
