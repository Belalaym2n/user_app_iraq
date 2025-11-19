import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

 import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/sharedWidgets/custom_form_field.dart';

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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              _buildHeader(),

              const SizedBox(height: 48),

              _buildEmailField(),

              const SizedBox(height: 20),

              _buildPasswordField(),

              const SizedBox(height: 12),

              _buildForgotPasswordButton(context),

              const SizedBox(height: 32),

              _buildLoginButton(context),

              const SizedBox(height: 24),

              _buildRegisterLink(context),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------
  // HEADER
  // --------------------

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.login,
            size: 30,
            color:AppColors.primaryColor,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          StringTranslateExtension(LocaleKeys.Login_welcome).tr() ,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          StringTranslateExtension(LocaleKeys.Login_continue_to_login).tr() ,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // --------------------
  // EMAIL
  // --------------------

  Widget _buildEmailField() {
    return CustomTextField(
      label:  StringTranslateExtension(LocaleKeys.Login_email).tr() ,
      hint: StringTranslateExtension(LocaleKeys.Login_email_required).tr() ,
      controller: emailCtrl,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }

  // --------------------
  // PASSWORD
  // --------------------

  Widget _buildPasswordField() {
    return CustomTextField(
      label:  StringTranslateExtension(LocaleKeys.Login_password).tr() ,
      hint:  StringTranslateExtension(LocaleKeys.Login_enter_password).tr() ,
      controller: passwordCtrl,
      obscureText: isPasswordHidden,
      textInputAction: TextInputAction.done,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          isPasswordHidden ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            isPasswordHidden = !isPasswordHidden;
          });
        })
    );
  }

}

  // --------------------
  // FORGOT PASSWORD
  // --------------------

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {}, // No logic
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

  // --------------------
  // LOGIN BUTTON
  // --------------------

  Widget _buildLoginButton(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      text: StringTranslateExtension(LocaleKeys.Login_login).tr(),
      onPressed: () {
        print("object");
        Navigator.pushNamed(context, AppRoutes.bottomNav) ;
      }, // No login logic
      isLoading: false,
    );
  }

  // --------------------
  // REGISTER LINK
  // --------------------

  Widget _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringTranslateExtension(LocaleKeys.Login_dont_have_account).tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(

          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signUp);
            // Get.toNamed(Routes.REGISTER);
          },
          child: Text(
            StringTranslateExtension(LocaleKeys.Login_sign_up).tr(),
            style: TextStyle(
              color:AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

