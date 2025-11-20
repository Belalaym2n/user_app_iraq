import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
 import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/custom_form_field.dart';
import '../build_card_info.dart';

class BuildBudgetWidget extends StatefulWidget {
  const BuildBudgetWidget({super.key});

  @override
  State<BuildBudgetWidget> createState() => _BuildBudgetWidgetState();
}

class _BuildBudgetWidgetState extends State<BuildBudgetWidget> {
  @override
  Widget build(BuildContext context) {
    return   _buildBudgetCard();
  }
  Widget _buildBudgetCard(    ) {
    return  buildCard(
      title: LocaleKeys.Add_Load_budget.tr(),
      icon: Icons.currency_exchange,
       children: [
        CustomTextField(
          label: LocaleKeys.Add_Load_budget.tr(),
           hint: '5000',
          controller:TextEditingController(),
          keyboardType: TextInputType.number,
          prefixIcon: Icon(Icons.currency_exchange, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 12),
        // _buildEstimatedCost(l10n, theme),
      ],
    );
  }
  // Widget _buildEstimatedCost( ) {
  //   return  Container(
  //       padding: const EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: [
  //            AppColors. secondaryColor.withOpacity(0.1),
  //             AppColors.  secondaryLight.withOpacity(0.05),
  //           ],
  //         ),
  //         borderRadius: BorderRadius.circular(12),
  //         border: Border.all(
  //           color:  AppColors. secondaryColor.withOpacity(0.3),
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           Icon(
  //             Icons.calculate_outlined,
  //             color:  AppColors. secondaryColor,
  //             size: 24,
  //           ),
  //           const SizedBox(width: 12),
  //           Text(  "Estimated"}: د.ع ${estimated.toStringAsFixed(0)}',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w600,
  //               color:   AppColors.primaryColor,
  //               fontSize: 16,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  }



