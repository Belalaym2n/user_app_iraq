import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/home_page/presentation/widgets/widgets/quickActions/quick_action_card.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/data_sources/quick_actions_model.dart';
import 'build_actions.dart';

class BuildQuickActions extends StatefulWidget {
  const BuildQuickActions({super.key});

  @override
  State<BuildQuickActions> createState() => _BuildQuickActionsState();
}

class _BuildQuickActionsState extends State<BuildQuickActions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.w * 0.055, // 20 / 360
        0,
        AppConstants.w * 0.055, // 20 / 360
        AppConstants.h * 0.031, // 24 / 776
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.h * 0.012), // 10 / 776

          // Section Header
          _build_headline(),

          SizedBox(height: AppConstants.h * 0.012), // 10 / 776

          // Action Cards Grid
          const BuildActions(),
        ],
      ),
    );
  }

  _build_headline() {
    return Text(
      LocaleKeys.Profile_quick_actions.tr(),
      style: AppTextStyles.displaySmall().copyWith(fontWeight: FontWeight.w800),
    );
  }
}
