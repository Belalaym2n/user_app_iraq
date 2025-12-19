import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/widgets/screen_widgets/problem_field.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'build_problems_cat.dart';
import 'build_section_title.dart';

class BuildQuickSuggestion extends StatefulWidget {
  const BuildQuickSuggestion({super.key});

  @override
  State<BuildQuickSuggestion> createState() => _BuildQuickSuggestionState();
}

class _BuildQuickSuggestionState extends State<BuildQuickSuggestion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..forward();

    _fadeAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.05), // 18
        decoration: BoxDecoration(
          color: AppColors.infoColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(AppConstants.w * 0.05), // 18
          border: Border.all(
            color: AppColors.infoColor.withOpacity(0.25),
            width: AppConstants.w * 0.003, // 1
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.infoColor.withOpacity(0),
              blurRadius: AppConstants.w * 0.033, // 12
              offset: Offset(0, AppConstants.h * 0.005), // 4
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AnimatedScale(
                  scale: 1.1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutBack,
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: AppColors.infoColor,
                    size: AppConstants.w * 0.061, // 22
                  ),
                ),
                SizedBox(width: AppConstants.w * 0.027), // 10
                Text(
                  LocaleKeys.Problems_quick_tips.tr(),
                  style: TextStyle(
                    fontSize: AppConstants.w * 0.044, // 16
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppConstants.h * 0.021), // 16

            _buildTipItem(
                LocaleKeys.Problems_tip_include_error_messages.tr()
            ),
            _buildTipItem(
                LocaleKeys.Problems_tip_mention_issue_started.tr()
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.h * 0.013), // 10
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: AppConstants.h * 0.006), // 5
            width: AppConstants.w * 0.019, // 7
            height: AppConstants.w * 0.019, // 7
            decoration: BoxDecoration(
              color: AppColors.infoColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppConstants.w * 0.033), // 12
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: AppConstants.w * 0.038, // 14
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
