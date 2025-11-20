import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/home_page/presentation/widgets/widgets/quickActions/quick_action_card.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/data_sources/quick_actions_model.dart';

class BuildQuickActions extends StatefulWidget {
  const BuildQuickActions({super.key});

  @override
  State<BuildQuickActions> createState() => _BuildQuickActionsState();
}

class _BuildQuickActionsState extends State<BuildQuickActions> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:   EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          _build_headline(),

          // Action Cards Grid
          _build_actions()

        ],

      ),


    );
  }

 Widget _build_actions(){
   List<ActionItem> actions = gerActions(context);

   return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action=actions[index];

        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 400 + (index * 100)),
          tween: Tween<double>(begin: 0, end: 1),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: QuickActionCard(
                  icon: action.icon,
                  title: action.title,
                  subtitle: action.subtitle,

                  color: action.color,
                  onTap: () {
                    action.navigation();
                    print("object");
                  }

              ),
            );
          },
        );
      },
    );
  }

  _build_headline() {
    return Text(
      LocaleKeys.Profile_quick_actions.tr(),
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: AppColors.primaryColor,
        fontSize: 18,
        letterSpacing: -0.3,
      ),
    );
  }}
