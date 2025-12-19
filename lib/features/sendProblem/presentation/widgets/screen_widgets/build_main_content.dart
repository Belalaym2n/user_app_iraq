import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/buttons.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/widgets/screen_widgets/problem_field.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/customField.dart';
import '../../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_validator.dart';
import '../../../../../core/validations/auth_validation.dart';
import 'build_problems_cat.dart';
import 'build_quick_suggestion.dart';
import 'build_section_title.dart';

class ProblemMainContent extends StatefulWidget {
  ProblemMainContent({super.key, required this.problem});
  TextEditingController problem;

  @override
  State<ProblemMainContent> createState() => _ProblemMainContentState();
}

class _ProblemMainContentState extends State<ProblemMainContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.w * 0.05), // 18 تقريباً على شاشة 360
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.h * 0.010), // 8

          buildProblemSectionTitle(
            LocaleKeys.Problems_selected_category.tr(),
            Icons.category_outlined,
          ),

          SizedBox(height: AppConstants.h * 0.015), // 12

          BuildProblemsCat(),

          SizedBox(height: AppConstants.h * 0.031), // 24

          buildProblemSectionTitle(
            LocaleKeys.Problems_problem_details.tr(),
            Icons.edit_note,
          ),

          SizedBox(height: AppConstants.h * 0.015), // 12

          buildProblemTextField(widget.problem),

          SizedBox(height: AppConstants.h * 0.031), // 24

          BuildQuickSuggestion(),

          SizedBox(height: AppConstants.h * 0.041), // 32
        ],
      ),
    );
  }
}
