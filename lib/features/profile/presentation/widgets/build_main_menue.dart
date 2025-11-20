import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
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

  Widget _buildMenuHeader(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 12,
            letterSpacing: 0.1,
            height: 1.5,

            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuDivider() {
    return const Divider(height: 1, thickness: .7);
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
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 28, color: AppColors.primaryColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style:TextStyle(fontSize: 10, fontWeight: FontWeight.w400,
                  color: Colors.grey, letterSpacing: 0.4, height: 1.5),
            )
          : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}
