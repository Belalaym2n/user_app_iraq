import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/buttons.dart';
import '../../../../../core/sharedWidgets/customField.dart';
import '../screensWidgets/build_login_header.dart';
import '../screensWidgets/build_login_text_links.dart';

class LoginScreenItem extends StatefulWidget {
  const LoginScreenItem({super.key});

  @override
  State<LoginScreenItem> createState() => _LoginScreenItemState();
}

class _LoginScreenItemState extends State<LoginScreenItem> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            AppConstants.w * 0.066, // 24 / 360
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppConstants.h * 0.051, // 40 / 776
              ),

              build_login_header(),

              SizedBox(
                height: AppConstants.h * 0.061, // 48 / 776
              ),

              _buildEmailField(),

              SizedBox(
                height: AppConstants.h * 0.025, // 20 / 776
              ),

              _buildPasswordField(),

              SizedBox(
                height: AppConstants.h * 0.015, // 12 / 776
              ),

              buildForgotPasswordButton(context),

              SizedBox(
                height: AppConstants.h * 0.1 , // 32 / 776
              ),

              _buildLoginButton(context),

              SizedBox(
                height: AppConstants.h * 0.011, // 24 / 776
              ),

              buildRegisterLink(context),

              SizedBox(
                height: AppConstants.h * 0.051, // 40 / 776
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return SizedBox(
      child: CustomTextFormField(
        label: StringTranslateExtension(LocaleKeys.Login_email).tr(),
        hint: StringTranslateExtension(LocaleKeys.Login_email_required).tr(),
        controller: emailCtrl,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: Icons.email_outlined,
      ),
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      label: StringTranslateExtension(LocaleKeys.Login_password).tr(),
      hint: StringTranslateExtension(LocaleKeys.Login_enter_password).tr(),
      controller: passwordCtrl,
      isPassword: true,
      prefixIcon: Icons.lock_outline,
    );
  }
}

Widget _buildLoginButton(BuildContext context) {
  return CustomButton(
    borderRadius: BorderRadius.circular(AppConstants.w * 0.083), // 30 / 360
    backgroundColor: AppColors.primaryColor,
    textColor: Colors.white,
    text: StringTranslateExtension(LocaleKeys.Login_login).tr(),
    onPressed: () {
      Navigator.pushNamed(context, AppRoutes.bottomNav);
    },
    isLoading: false,
  );
}
