import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/sharedWidgets/language_option.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';

class LanguagePickerBottomSheet extends StatelessWidget {
  final String currentLanguage;
  final Function(String) onLanguageSelected;

  const LanguagePickerBottomSheet({
    Key? key,
    required this.currentLanguage,
    required this.onLanguageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textMuted.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildLanguageList(context),
          const SizedBox(height: 20),
        ],
      ),
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
            Icons.language_rounded,
            color: AppColors.primaryColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            LocaleKeys.Profile_language.tr(),
            style: AppTextStyles.displaySmall(),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close_rounded,
            color: AppColors.textMuted,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageList(BuildContext context) {
    return Column(
      children: [
        LanguageOption(
          languageCode: 'ar',
          languageName: 'العربية',
          languageNameEnglish: 'Arabic',
          flag: '🇮🇶',
          isSelected: currentLanguage == 'ar',
          onTap: () => onLanguageSelected('ar'),
        ),
        const SizedBox(height: 12),
        LanguageOption(
          languageCode: 'en',
          languageName: 'English',
          languageNameEnglish: 'English',
          flag: '🇺🇸',
          isSelected: currentLanguage == 'en',
          onTap: () => onLanguageSelected('en'),
        ),
        const SizedBox(height: 12),

      ],
    );
  }
}

// ============== Language Option Widget ==============

