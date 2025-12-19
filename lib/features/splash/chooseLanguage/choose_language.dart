import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/login/presentation/pages/auto_login.dart';
import 'package:user_app_iraq/features/splash/onBoard/on_board_item.dart';

import '../../../../../core/sharedWidgets/language_option.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../core/cahsing/get_storage_helper.dart';
import '../../../../../core/utils/app_constants.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppConstants.w * 0.066,   // 24
            AppConstants.h * 0.041,   // 32
            AppConstants.w * 0.066,   // 24
            AppConstants.h * 0.030,   // 24
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: AppConstants.h * 0.031), // 24
              _buildLanguageList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _build_lang_icon(),

        SizedBox(width: AppConstants.w * 0.044), // 16

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                LocaleKeys.Profile_language.tr(),
                style: AppTextStyles.displaySmall().copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: AppConstants.h * 0.010), // 8
              _buildSubtitle(context),
            ],
          ),
        ),
      ],
    );
  }

 Widget _build_lang_icon(){
    return      Container(
      padding: EdgeInsets.all(AppConstants.w * 0.033), // 12
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.15),
            AppColors.primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.038), // 14
      ),
      child: Icon(
        Icons.language_rounded,
        color: AppColors.primaryColor,
        size: AppConstants.w * 0.077, // 28
      ),
    );
  }
  Widget _buildSubtitle(BuildContext context) {
    return Text(
      LocaleKeys.Splash_select_preferred_language.tr(),
      style: AppTextStyles.bodyMedium().copyWith(
        color: AppColors.textMuted,
        fontSize: AppConstants.w * 0.038, // 14
      ),
    );
  }

  Widget _buildLanguageList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textMuted.withOpacity(0.03),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.044), // 16
        border: Border.all(
          color: AppColors.textMuted.withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.h * 0.020, // 16
        ),
        child: Column(
          children: [
            LanguageOption(
              languageCode: 'ar',
              languageName: 'العربية',
              languageNameEnglish: 'Arabic',
              flag: '🇮🇶',
              isSelected: context.locale.languageCode == 'ar',
              onTap: () => _changeLanguage(context, 'ar'),
            ),

            SizedBox(height: AppConstants.h * 0.015), // 12

            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.textMuted.withOpacity(0.08),
              indent: AppConstants.w * 0.194, // 70
            ),

            SizedBox(height: AppConstants.h * 0.015), // 12

            LanguageOption(
              languageCode: 'en',
              languageName: 'English',
              languageNameEnglish: 'English',
              flag: '🇺🇸',
              isSelected: context.locale.languageCode == 'en',
              onTap: () => _changeLanguage(context, 'en'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _changeLanguage(
      BuildContext context,
      String languageCode,
      ) async {
    Locale newLocale;

    switch (languageCode) {
      case 'ar':
        newLocale = const Locale('ar');
        break;
      case 'en':
        newLocale = const Locale('en');
        break;
      default:
        newLocale = const Locale('ar');
    }

    await GetStorageHelper.write('lang', languageCode);
    await context.setLocale(newLocale);

    Future.delayed(Duration(milliseconds: 500), () =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const AutoLogin()),
          (route) => false,
    ));
  }
}


