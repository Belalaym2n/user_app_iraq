
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/appSettings/styled_buttom_sheet_state.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
class StyledSettingsBottomSheet extends StatefulWidget {
  final bool isDarkMode;
  final bool notificationsEnabled;
  final String currentLanguage;
  final Function(bool)? onDarkModeChanged;
  final Function(bool)? onNotificationsChanged;
  final VoidCallback? onChangeLanguage;

  const StyledSettingsBottomSheet({
    Key? key,
    required this.isDarkMode,
    required this.notificationsEnabled,
    required this.currentLanguage,
    this.onDarkModeChanged,
    this.onNotificationsChanged,
    this.onChangeLanguage,
  }) : super(key: key);

  static void show(
      BuildContext context, {
        required bool isDarkMode,
        required bool notificationsEnabled,
        required String currentLanguage,
        Function(bool)? onDarkModeChanged,
        Function(bool)? onNotificationsChanged,
        VoidCallback? onChangeLanguage,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StyledSettingsBottomSheet(
        isDarkMode: isDarkMode,
        notificationsEnabled: notificationsEnabled,
        currentLanguage: currentLanguage,
        onDarkModeChanged: onDarkModeChanged,
        onNotificationsChanged: onNotificationsChanged,
        onChangeLanguage: onChangeLanguage,
      ),
    );
  }

  @override
  State<StyledSettingsBottomSheet> createState() =>
      StyledSettingsBottomSheetState();
}
