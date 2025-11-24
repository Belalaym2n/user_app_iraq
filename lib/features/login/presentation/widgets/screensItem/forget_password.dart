import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/sharedWidgets/buttons.dart';
import '../../../../../core/sharedWidgets/customField.dart';
import '../../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../screensWidgets/build_forget_app_bar.dart';
import '../screensWidgets/build_forget_password_text.dart';

class ForgetPasswordItem extends StatefulWidget {
  const ForgetPasswordItem({super.key});

  @override
  State<ForgetPasswordItem> createState() => _ForgetPasswordItemState();
}

class _ForgetPasswordItemState extends State<ForgetPasswordItem>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnim = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _scaleAnim = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: build_foget_password_AppBar(context),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.05),
        child: FadeTransition(
          opacity: _fadeAnim,
          child: ScaleTransition(scale: _scaleAnim, child: _buildForm()),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppConstants.h * 0.07),

          /// Icon Animation
          build_forget_pass_texts(),
          SizedBox(height: AppConstants.h * 0.05),

          CustomTextFormField(
            label: LocaleKeys.Login_email.tr(),
            hint: StringTranslateExtension(
              LocaleKeys.Login_email_required,
            ).tr(),
            controller: TextEditingController(),

            keyboardType: TextInputType.emailAddress,

            prefixIcon: Icons.email_outlined,
          ),

          SizedBox(height: AppConstants.h * 0.04),

          large_button(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            buttonName: LocaleKeys.forgetPassword_resetButton.tr(),
          ),

          SizedBox(height: AppConstants.h * 0.02),

          _backButton(),
        ],
      ),
    );
  }

  Widget _backButton() {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        LocaleKeys.forgetPassword_backToLogin.tr(),
        style: _backTextStyle,
      ),
    );
  }
  TextStyle get _backTextStyle => TextStyle(
    fontSize: AppConstants.w * 0.04,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

}
