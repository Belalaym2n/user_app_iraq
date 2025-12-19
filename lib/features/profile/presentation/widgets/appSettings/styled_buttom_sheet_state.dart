import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/appSettings/styled_card.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'buttom_sheet_setting.dart';

class StyledSettingsBottomSheetState extends State<StyledSettingsBottomSheet> {
  late bool _isDarkMode;
  late bool _notificationsEnabled;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    _notificationsEnabled = widget.notificationsEnabled;
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    widget.onDarkModeChanged?.call(value);
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
    widget.onNotificationsChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _buildSheetDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildSettingsCards(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  BoxDecoration _buildSheetDecoration() {
    return BoxDecoration(
      color: AppColors.surfaceColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.settings_rounded,
            color: AppColors.primaryColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            LocaleKeys.Profile_app_settings.tr(),
            style: AppTextStyles.displaySmall(),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close_rounded, color: AppColors.textMuted, size: 24),
        ),
      ],
    );
  }

  Widget _buildSettingsCards() {
    return Column(
      children: [
        const SizedBox(height: 12),
        StyledSettingCard(
          title: LocaleKeys.Profile_notifications.tr(),
          subtitle: _notificationsEnabled
              ? 'الإشعارات مفعلة'
              : 'الإشعارات متوقفة',
          icon: _notificationsEnabled
              ? Icons.notifications_active_rounded
              : Icons.notifications_off_rounded,
          color: AppColors.warningColor,
          trailing: Switch(
            value: _notificationsEnabled,
            onChanged: _toggleNotifications,
            activeColor: AppColors.warningColor,
          ),
        ),
        const SizedBox(height: 12),

        StyledSettingCard(
          title: LocaleKeys.Profile_language.tr(),
          subtitle: widget.currentLanguage,
          icon: Icons.language_rounded,
          color: AppColors.successColor,
          onTap: widget.onChangeLanguage,
        ),
      ],
    );
  }
}
