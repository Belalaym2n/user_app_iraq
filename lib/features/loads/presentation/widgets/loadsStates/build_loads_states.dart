import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import 'builds_load_state_item.dart';

class BuildLoadsStates extends StatefulWidget {
  const BuildLoadsStates({super.key});

  @override
  State<BuildLoadsStates> createState() => _BuildLoadsStatesState();
}

class _BuildLoadsStatesState extends State<BuildLoadsStates> {
  @override
  Widget build(BuildContext context) {
    return _buildStatsSection();
  }

  Widget _buildStatsSection() {
    return Container(

      margin: EdgeInsets.fromLTRB(
        AppConstants.w * 0.0444, // بدل 16
        AppConstants.h * 0.01,   // بدل 8
        AppConstants.w * 0.0444, // بدل 16
        AppConstants.h * 0.02,   // بدل 16
      ),
      padding: EdgeInsets.all(
        AppConstants.w * 0.0555, // بدل 20
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.08),
            AppColors.primaryLight.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(
          AppConstants.w * 0.0555, // بدل 20
        ),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.08),
            blurRadius: AppConstants.w * 0.0416, // بدل 15
            offset: Offset(
              AppConstants.w * 0,         // بدل 0
              AppConstants.h * 0.00625,   // بدل 5
            ),
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: BuildsLoadStateItem(
                color: AppColors.primaryColor,
                icon: Icons.inventory_2_rounded,
                title: LocaleKeys.Loads_total_loads.tr(),
                value: "3",
              ),
            ),

            _buildDivider(),

            Expanded(
              child: BuildsLoadStateItem(
                color: AppColors.successColor,
                icon: Icons.gavel_rounded,
                title: LocaleKeys.Loads_new_bids.tr(),
                value: "2",
              ),
            ),

            _buildDivider(),

            Expanded(
              child: BuildsLoadStateItem(
                color: AppColors.secondaryColor,
                icon: Icons.gavel_rounded,
                title: LocaleKeys.Loads_active.tr(),
                value: "2",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: AppConstants.w * 0.0083, // بدل 3
      height: AppConstants.h * 0.05,  // بدل 40
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.0444, // بدل 16
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.primaryColor.withOpacity(0.2),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
