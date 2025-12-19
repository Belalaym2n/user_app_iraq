import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/cahsing/get_storage_helper.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/personalData/personal_data.dart';
import '../../../../core/sharedWidgets/text_styles.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import 'appSettings/buttom_sheet_setting.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/personalData/personal_data.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../bloc/profile_bloc.dart';
import 'appSettings/buttom_sheet_setting.dart';
import 'appSettings/language_bottom_sheet.dart';

class BuildMainMenu extends StatelessWidget {
  const BuildMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainMenu(context);
  }

  Widget _buildMainMenu(BuildContext context) {
    final theme = Theme.of(context);
    final userProfile = context.read<ProfileBloc>().userProfileModel;

    return Column(
      children: [
        _buildMenuHeader(LocaleKeys.Profile_account_settings.tr(), theme),
        _buildMenuItem(
          context,
          icon: Icons.person_outline,
          title: LocaleKeys.Profile_personal_information.tr(),
          subtitle: LocaleKeys.Profile_manage_profile_details.tr(),
          onTap: () {
            if (userProfile != null) {
              print('User ID: ${userProfile.id}');  // ✅ شوف الـ ID الصحيح

              EditablePersonalInfoBottomSheet.show(
                context,
                userProfile: userProfile,
              );
            }
          },
          theme: theme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.settings_outlined,
          title: LocaleKeys.Profile_app_settings.tr(),
          subtitle:
              "${LocaleKeys.Profile_notifications.tr()} • ${LocaleKeys.Profile_language.tr()} • ${LocaleKeys.Profile_theme.tr()}",
          onTap: () {
            StyledSettingsBottomSheet.show(
              context,
              isDarkMode: false,
              notificationsEnabled: true,
              currentLanguage: context.locale.languageCode,
              onDarkModeChanged: (value) {},
              onNotificationsChanged: (value) {},
              onChangeLanguage: () {
                _showLanguagePicker(context);
              },
            );
          },
          theme: theme,
        ),
      ],
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => LanguagePickerBottomSheet(
        currentLanguage: context.locale.languageCode,
        onLanguageSelected: (languageCode) {
          _changeLanguage(context, languageCode);
        },
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    Locale newLocale;

    switch (languageCode) {
      case 'ar':
        newLocale = const Locale('ar');
        break;
      case 'en':
        newLocale = const Locale('en');
        break;
      case 'ku':
        newLocale = const Locale('ku');
        break;
      default:
        newLocale = const Locale('ar');
    }

    // 🔥 حفظ اللغة
    GetStorageHelper.write('lang', languageCode);

    context.setLocale(newLocale);
    Navigator.of(context).pop(); // Close language picker

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم تغيير اللغة بنجاح',
          style: AppTextStyles.bodyMedium().copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.successColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }



  Widget _buildMenuHeader(String title, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.w * 0.055,
        AppConstants.h * 0.02,
        AppConstants.w * 0.055,
        AppConstants.h * 0.005,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: AppConstants.w * 0.033,
            letterSpacing: 0.1,
            height: 1.5,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Function() onTap,
    required ThemeData theme,
    Color? titleColor,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.04,
        vertical: AppConstants.h * 0.004,
      ),
      leading: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.02),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppConstants.w * 0.022),
        ),
        child: Icon(
          icon,
          size: AppConstants.w * 0.075,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppConstants.w * 0.033,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: AppConstants.w * 0.027,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                letterSpacing: 0.4,
                height: 1.5,
              ),
            )
          : null,
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: AppConstants.w * 0.044,
      ),
      onTap: onTap,
    );
  }
}
