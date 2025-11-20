import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../build_card_info.dart';

class PickupAndDelivery extends StatefulWidget {
  const PickupAndDelivery({super.key});

  @override
  State<PickupAndDelivery> createState() => _PickupAndDeliveryState();
}

class _PickupAndDeliveryState extends State<PickupAndDelivery> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _buildLocationsCard(theme);
  }

  Widget _buildLocationsCard(ThemeData theme) {
    return buildCard(
      title: StringTranslateExtension(
        LocaleKeys.Add_Load_pickupAndDelivery,
      ).tr(),
      icon: Icons.location_on_outlined,

      children: [
        _buildLocationTile(
          title:
              "${StringTranslateExtension(LocaleKeys.Add_Load_pickupLocation).tr()} *",
          onTap: () => _selectLocation(true),
          theme: theme,
          icon: Icons.upload_outlined,
          color: AppColors.secondaryColor,
        ),
        const SizedBox(height: 12),
        _buildLocationTile(
          title:
              "${StringTranslateExtension(LocaleKeys.Add_Load_deliveryLocation).tr()} *",
          onTap: () => _selectLocation(false),
          theme: theme,
          icon: Icons.download_outlined,
          color: AppColors.primaryLight,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildLocationTile({
    required String title,
    required VoidCallback onTap,
    required ThemeData theme,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.neutralGray,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            build_icon(icon),
            SizedBox(width: AppConstants.w * 0.07),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    StringTranslateExtension(title).tr(),
                    style: AppTextStyles.bodyLarge().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    StringTranslateExtension(
                      LocaleKeys.Add_Load_tapToSelectLocation,
                    ).tr(),
                    style: AppTextStyles.bodySmall(),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppConstants.w * 0.07),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 22),
          ],
        ),
      ),
    );
  }

  build_icon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[400]!,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  void _selectLocation(bool isPickup) async {}
}
