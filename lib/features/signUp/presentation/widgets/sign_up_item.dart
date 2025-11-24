import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/sharedWidgets/customField.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../generated/locale_keys.g.dart';
import 'build_login_link.dart';
import 'build_sign_up_header.dart';

class SignUpItem extends StatefulWidget {
  const SignUpItem({super.key});

  @override
  State<SignUpItem> createState() => _SignUpItemState();
}

class _SignUpItemState extends State<SignUpItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: AppConstants.h * 0.000, // 0
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.w * 0.066), // 24 / 360
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              build_sign_up_header(context),

              SizedBox(height: AppConstants.h * 0.028), // 22 / 776

              _build_fields(),

              _buildRegisterButton(),

              SizedBox(height: AppConstants.h * 0.008), // 6 / 776

              buildLoginLink(context),

              SizedBox(height: AppConstants.h * 0.051), // 40 / 776
            ],
          ),
        ),
      ),
    );
  }

  Widget _build_fields() {
    return Column(
      children: [
        _buildNameField(),

        SizedBox(height: AppConstants.h * 0.025), // 20 / 776

        _buildEmailField(),

        SizedBox(height: AppConstants.h * 0.025), // 20 / 776

        _buildPasswordField(),

        SizedBox(height: AppConstants.h * 0.025), // 20 / 776

        _buildConfirmPasswordField(),

        SizedBox(height: AppConstants.h * 0.041),
        // 32 / 776
      ],
    );
  }

  Widget _buildNameField() {
    return CustomTextFormField(
      label: LocaleKeys.register_full_name.tr(),
      hint: LocaleKeys.register_enter_full_name.tr(),
      controller: TextEditingController(),
      prefixIcon: Icons.person_outline,
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      label: LocaleKeys.register_email.tr(),
      hint: LocaleKeys.register_enter_email.tr(),
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      label: LocaleKeys.register_password.tr(),
      hint: LocaleKeys.register_enter_password.tr(),
      controller: TextEditingController(),
      isPassword: true,
      prefixIcon: Icons.lock_outline,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextFormField(
      label: LocaleKeys.register_confirm_password.tr(),
      hint: LocaleKeys.register_enter_confirm_password.tr(),
      controller: TextEditingController(),
      prefixIcon: Icons.lock_outline,
    );
  }

  Widget _buildRegisterButton() {
    return CustomButton(
      borderRadius: BorderRadius.circular(AppConstants.w * 0.083), // 30 / 360
      textColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      text: LocaleKeys.register_create_account_button.tr(),
      onPressed: () {},
    );
  }

}
