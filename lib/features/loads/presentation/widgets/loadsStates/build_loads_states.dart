import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import 'builds_load_state_item.dart';

class BuildLoadsStates extends StatefulWidget {
  const BuildLoadsStates({super.key});

  @override
  State<BuildLoadsStates> createState() => _BuildLoadsStatesState();
}

class _BuildLoadsStatesState extends State<BuildLoadsStates> {
  @override
  Widget build(BuildContext context) {
    return   _buildStatsSection();
  }


  Widget _buildStatsSection(
        ) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.08),
            AppColors.primaryLight.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child:  Row(
        children: [
          Expanded(
            child: BuildsLoadStateItem(

              color:AppColors.primaryColor,
              icon:
              Icons.inventory_2_rounded,
              title:  LocaleKeys.Loads_total_loads.tr(),
              value: "3",


            ),
          ),
           Expanded(
            child: BuildsLoadStateItem(

              color:AppColors.successColor,
              icon:
              Icons.gavel_rounded,
              title:  LocaleKeys.Loads_new_bids.tr(),
              value: "2",


            ),
          ),
           Expanded(
            child: BuildsLoadStateItem(
              color:AppColors.secondaryColor,
              icon:
              Icons.gavel_rounded,
              title:  LocaleKeys.Loads_active.tr(),
              value: "2",



            ),
          ),
        ],

    ));
  }

}
