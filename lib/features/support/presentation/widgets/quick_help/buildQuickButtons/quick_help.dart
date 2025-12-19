import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:user_app_iraq/generated/locale_keys.g.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';
import 'build_quick_list.dart';

class QuickHelp extends StatefulWidget {
  const QuickHelp({super.key});

  @override
  State<QuickHelp> createState() => _QuickHelpState();
}

class _QuickHelpState extends State<QuickHelp> {
  @override
  Widget build(BuildContext context) {
    return _buildQuickHelpSection();
  }
Widget _build_headline_text(){
    return   Text(
      LocaleKeys.Support_quickHelp.tr(),
      style: AppTextStyles.titleMedium().copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
}
  Widget _buildQuickHelpSection() {
    return   Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------------- Title ----------------
            _build_headline_text(),
            const SizedBox(height: 16),
            BuildQuickList(),

          ],
        ),

    );
  }

  /// ---------------- Quick Action Card ----------------

}
