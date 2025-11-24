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
    return _buildBudgetCard();
  }

  Widget _buildBudgetCard() {
    return buildCard(
      title: LocaleKeys.Add_Load_budget.tr(),
      icon: Icons.currency_exchange,
      children: [
        CustomTextField(
          label: LocaleKeys.Add_Load_budget.tr(),
          hint: '5000',
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
          prefixIcon: Icon(
            Icons.currency_exchange,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        // _buildEstimatedCost(l10n, theme),
      ],
    );
  }


}
