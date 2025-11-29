import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/validations/auth_validation.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/buttons.dart';
import '../../../../../core/sharedWidgets/customField.dart';
import '../../../data/models/loginModel.dart';
import '../../bloc/bloc.dart';
import '../../bloc/loginEvents.dart';
import '../screensWidgets/build_login_header.dart';
import '../screensWidgets/build_login_text_links.dart';

class LoginScreenItem extends StatefulWidget {
  const LoginScreenItem({super.key});

  @override
  State<LoginScreenItem> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreenItem> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool isPasswordHidden = true;
  final _formKey = GlobalKey<FormState>();

  Widget _buildLoginButton(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(AppConstants.w * 0.083),
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      text: StringTranslateExtension(LocaleKeys.Login_login).tr(),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final user = LoginModel(
            email: emailCtrl.text.trim(),
            password: passwordCtrl.text.trim(),
          );

          context.read<LoginBloc>().add(LoginButtonPressed(model: user));
        }
      },
      isLoading: false,
    );
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            AppConstants.w * 0.066, // 24 / 360
          ),
          child: Form(
            key: _formKey,
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
                  height: AppConstants.h * 0.1, // 32 / 776
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
      ),
    );
  }

  Widget _buildEmailField() {
    return SizedBox(
      child: CustomTextFormField(
        validator: AuthValidator.validateEmail,

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
      validator: AuthValidator.validatePassword,
      label: StringTranslateExtension(LocaleKeys.Login_password).tr(),
      hint: StringTranslateExtension(LocaleKeys.Login_enter_password).tr(),
      controller: passwordCtrl,
      isPassword: true,
      prefixIcon: Icons.lock_outline,
    );
  }

  void clearForm() {
    _formKey.currentState?.reset(); // 🔥 تمسح كل الأخطاء
    emailCtrl.clear();
    passwordCtrl.clear();
  }
}
