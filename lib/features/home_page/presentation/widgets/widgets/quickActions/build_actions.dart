import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/home_page/presentation/widgets/widgets/quickActions/quick_action_card.dart';

import '../../../../data/data_sources/quick_actions_model.dart';

class BuildActions extends StatefulWidget {
  const BuildActions({super.key});

  @override
  State<BuildActions> createState() => _BuildActionsState();
}

class _BuildActionsState extends State<BuildActions> {
  @override
  Widget build(BuildContext context) {
    List<ActionItem> actions = gerActions(context);

    return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing:  0.043*AppConstants.w,
        mainAxisSpacing: 0.043*AppConstants.w,
        childAspectRatio: 0.0036*AppConstants.w,
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
    );  }
}
