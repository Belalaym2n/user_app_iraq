import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart'
    show AppTextStyles;

class ActiveShipmentsSection extends StatefulWidget {
  const ActiveShipmentsSection({Key? key}) : super(key: key);

  @override
  State<ActiveShipmentsSection> createState() => _ActiveShipmentsSectionState();
}

class _ActiveShipmentsSectionState extends State<ActiveShipmentsSection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // FIXED: Return regular widget instead of SliverToBoxAdapter
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated section header
          _build_headline(),
          _build_description(),
        ],
      ),
    );
  }

  Widget _build_headline() {
    return Text(
      LocaleKeys.Home_active.tr(), // ?? 'Active Shipments',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: AppColors.primaryColor,
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _build_description() {
    return Text(
      LocaleKeys.Home_no_active_shipments.tr(),

      style: AppTextStyles.bodyMedium(),
    );
  }
}
