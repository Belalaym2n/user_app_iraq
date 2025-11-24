import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class BuildMainMenu extends StatelessWidget {
  const BuildMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainMenu(context);
  }

  Widget _buildMainMenu(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        _buildMenuHeader(LocaleKeys.Profile_account_settings.tr(), theme),

        _buildMenuItem(
          context,
          icon: Icons.person_outline,
          title: LocaleKeys.Profile_personal_information.tr(),
          subtitle: LocaleKeys.Profile_manage_profile_details.tr(),
          onTap: () {},
          theme: theme,
        ),

        _buildMenuItem(
          context,
          icon: Icons.settings_outlined,
          title: LocaleKeys.Profile_app_settings.tr(),
          subtitle:
          "${LocaleKeys.Profile_notifications.tr()} • ${LocaleKeys.Profile_language.tr()} • ${LocaleKeys.Profile_theme.tr()}",
          onTap: () {},
          theme: theme,
        ),

        _buildMenuItem(
          context,
          icon: Icons.flash_on_outlined,
          title: LocaleKeys.Profile_quick_actions.tr(),
          subtitle: LocaleKeys.Profile_help_center.tr(),
          onTap: () {},
          theme: theme,
        ),
      ],
    );
  }

  /// ------------------------------
  /// HEADER
  /// ------------------------------
  Widget _buildMenuHeader(String title, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.w * 0.055, // بدل 20
        AppConstants.h * 0.02,  // بدل 16
        AppConstants.w * 0.055, // بدل 20
        AppConstants.h * 0.005,  // بدل 8
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: AppConstants.w * 0.033, // بدل 12
            letterSpacing: 0.1,
            height: 1.5,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  /// ------------------------------
  /// DIVIDER
  /// ------------------------------
  Widget _buildMenuDivider() {
    return Divider(
      height: AppConstants.h * 0.0015, // بدل 1
      thickness: AppConstants.h * 0.0009, // بدل .7
    );
  }

  /// ------------------------------
  /// MENU ITEM
  /// ------------------------------
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
        horizontal: AppConstants.w * 0.04, // بدل 16
        vertical: AppConstants.h * 0.004,  // بدل 4
      ),

      /// LEADING ICON
      leading: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.02 ), // بدل 8
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppConstants.w * 0.022), // بدل 8
        ),
        child: Icon(
          icon,
          size: AppConstants.w * 0.075, // بدل 28
          color: AppColors.primaryColor,
        ),
      ),

      /// TITLE
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppConstants.w * 0.033, // بدل 12
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      ),

      /// SUBTITLE
      subtitle: subtitle.isNotEmpty
          ? Text(
        subtitle,
        style: TextStyle(
          fontSize: AppConstants.w * 0.027, // بدل 10
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          letterSpacing: 0.4,
          height: 1.5,
        ),
      )
          : null,

      /// TRAILING ICON
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: AppConstants.w * 0.044, // بدل 16
      ),

      onTap: onTap,
    );
  }
}
