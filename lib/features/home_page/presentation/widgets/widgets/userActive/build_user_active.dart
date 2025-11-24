import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart'
    show AppTextStyles;
import '../../../../../../core/utils/app_constants.dart';

class ActiveShipmentsSection extends StatefulWidget {
  const ActiveShipmentsSection({Key? key}) : super(key: key);

  @override
  State<ActiveShipmentsSection> createState() => _ActiveShipmentsSectionState();
}

class _ActiveShipmentsSectionState extends State<ActiveShipmentsSection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.w * 0.05, // = 20
        0,
        0,
        AppConstants.h * 0.005, // = 4
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_build_headline() ],
      ),
    );
  }

  Widget _build_headline() {
    return Text(
      LocaleKeys.Home_active.tr(),
      style: AppTextStyles.displaySmall().copyWith(fontWeight: FontWeight.w800),
    );
  }
}
