import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/sharedWidgets/customField.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/validations/auth_validation.dart';
import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/user_model.dart';
import '../bloc/bloc.dart';
import '../bloc/signUpEvents.dart';
import 'build_login_link.dart';
import 'build_sign_up_header.dart';

class SignUpItem extends StatefulWidget {
  const SignUpItem({super.key});

  @override
  State<SignUpItem> createState() => SignUpItemState();
}

class SignUpItemState extends State<SignUpItem> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _confirmPassController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clearForm() {
    _formKey.currentState?.reset(); // 🔥 تمسح كل الأخطاء

    _nameController.clear();
    _phoneController.clear();
    _confirmPassController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

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
          child: Form(
            key: _formKey,
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
      ),
    );
  }

  Widget _build_fields() {
    return Column(
      children: [
        _buildNameField(),

        SizedBox(height: AppConstants.h * 0.01), // 20 / 776

        _buildEmailField(),

        SizedBox(height: AppConstants.h * 0.01), // 20 / 776
        _buildPhoneField(),
        SizedBox(height: AppConstants.h * 0.01), // 20 / 776

        _buildPasswordField(),

        SizedBox(height: AppConstants.h * 0.01), // 20 / 776

        _buildConfirmPasswordField(),

        SizedBox(height: AppConstants.h * 0.02),
        // 32 / 776
      ],
    );
  }

  Widget _buildNameField() {
    return CustomTextFormField(
      validator: AuthValidator.validateField,

      label: LocaleKeys.register_full_name.tr(),
      hint: LocaleKeys.register_enter_full_name.tr(),
      controller: _nameController,
      prefixIcon: Icons.person_outline,
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      validator: AuthValidator.validateEmail,
      label: LocaleKeys.register_email.tr(),
      hint: LocaleKeys.register_enter_email.tr(),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      validator: AuthValidator.validatePassword,
      label: LocaleKeys.register_password.tr(),
      hint: LocaleKeys.register_enter_password.tr(),
      controller: _passwordController,
      isPassword: true,
      prefixIcon: Icons.lock_outline,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextFormField(
      validator: AuthValidator.validatePassword,
      isPassword: true,
      label: LocaleKeys.register_confirm_password.tr(),
      hint: LocaleKeys.register_enter_confirm_password.tr(),
      controller: _confirmPassController,
      prefixIcon: Icons.lock_outline,
    );
  }

  Widget _buildPhoneField() {
    return CustomTextFormField(
      validator: AuthValidator.validateIraqPhone,
      label: LocaleKeys.register_phone.tr(),
      hint: LocaleKeys.register_enterYourPhone.tr(),
      controller: _phoneController,
      prefixIcon: Icons.phone,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildRegisterButton() {
    return CustomButton(
      borderRadius: BorderRadius.circular(AppConstants.w * 0.083),
      // 30 / 360
      textColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      text: LocaleKeys.register_create_account_button.tr(),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final user = UserModel(
            userID: 0,
            phone: _phoneController.text.trim(),
            confirmPassword: _confirmPassController.text.trim(),
            name: _nameController.text.trim(),
            gmail: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

          context.read<SignUpBloc>().add(SignUpButtonPressed(user));
        }
      },
    );
  }
}
