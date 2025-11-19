import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../generated/locale_keys.g.dart';

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
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),

              const SizedBox(height:22),

              _buildNameField(),
              const SizedBox(height: 20),

              _buildEmailField(),
              const SizedBox(height: 20),

              _buildPasswordField(),
              const SizedBox(height: 20),

              _buildConfirmPasswordField(),
              const SizedBox(height: 32),

              _buildRegisterButton(),
              const SizedBox(height: 24),

              _buildLoginLink(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------- APP BAR --------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: AppConstants.h*0.05,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () {},
      ),
      title: Text(
        LocaleKeys.register_create_account.tr(),
        style: const TextStyle(color: Colors.black87),
      ),
      centerTitle: true,
    );
  }

  // -------------------- HEADER --------------------
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.person_add,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          LocaleKeys.register_create_account.tr(),
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          LocaleKeys.register_enter_details.tr(),
          style: Theme.of(

            context,
          ).textTheme.bodyLarge?.copyWith(

              color: Colors.grey[600]),
        ),
      ],
    );
  }

  // -------------------- NAME FIELD --------------------
  Widget _buildNameField() {
    return CustomTextField(
      label: LocaleKeys.register_full_name.tr(),
      hint: LocaleKeys.register_enter_full_name.tr(),
      controller: TextEditingController(),
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.person_outline),
    );
  }

  // -------------------- EMAIL FIELD --------------------
  Widget _buildEmailField() {
    return CustomTextField(
      label: LocaleKeys.register_email.tr(),
      hint: LocaleKeys.register_enter_email.tr(),
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }

  // -------------------- PASSWORD FIELD --------------------
  Widget _buildPasswordField() {
    return  CustomTextField(
        label: LocaleKeys.register_password.tr(),
        hint: LocaleKeys.register_enter_password.tr(),
        controller: TextEditingController(),

        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            // controller.isPasswordHidden.value
            //     ? Icons.visibility_off
            Icons.visibility,
          ),
          // onPressed: controller.togglePasswordVisibility,
        ),
        // validator: controller.validatePassword,

    );
  }

  // -------------------- CONFIRM PASSWORD --------------------
  Widget _buildConfirmPasswordField() {
    return   CustomTextField(
        label: LocaleKeys.register_confirm_password.tr(),
        hint: LocaleKeys.register_enter_confirm_password.tr(),
        controller: TextEditingController(),
        textInputAction: TextInputAction.done,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.visibility_off),
          // onPressed: controller.toggleConfirmPasswordVisibility,
        ),
        // validator: controller.validateConfirmPassword,
        // onFieldSubmitted: (_) => controller.register(),

    );
  }

  // -------------------- REGISTER BUTTON --------------------
  Widget _buildRegisterButton() {
    return  CustomButton(
      textColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
        text: LocaleKeys.register_create_account_button.tr(),
        onPressed: () {},
        // isLoading: controller.isLoading.value,

    );
  }

  // -------------------- LOGIN FOOTER --------------------
  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.register_already_have_account.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.register_login.tr(),
            style: TextStyle(
              color:  AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
