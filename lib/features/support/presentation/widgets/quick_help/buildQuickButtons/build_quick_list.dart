import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/support/presentation/widgets/quick_help/payment/payment_help.dart';

import '../../../../../../config/routes/app_router.dart';
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../appGuide/build_app_guide.dart';
import 'build_quick_card.dart';

class BuildQuickList extends StatefulWidget {
  const   BuildQuickList({super.key});

  @override
  State<BuildQuickList> createState() => _BuildQuickListState();
}

class _BuildQuickListState extends State<BuildQuickList> {
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        buildQuickActionCard(
          title: LocaleKeys.Support_paymentHelp.tr(),
          icon: Icons.payment_outlined,
          color: AppColors.successColor,
          onTap: (){
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => const PaymentHelpDialog(),
            );
          },
        ),
        buildQuickActionCard(
          title: LocaleKeys.Support_reportIssue.tr(),
          icon: Icons.report_problem_outlined,
          color: AppColors.warningColor,
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.problems);

          },
        ),
        buildQuickActionCard(
          title:  LocaleKeys.Support_appGuide.tr() ,
          icon: Icons.help_outline,
          color: AppColors.infoColor,
          onTap: (){  showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => const AppGuideDialog(),
          );},
        ),
        buildQuickActionCard(
          title:  LocaleKeys.Support_accountIssue.tr() ,
          icon: Icons.account_circle_outlined,
          color: AppColors.secondaryColor,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.problems);

          },
        ),

      ],
    );
  }

}
