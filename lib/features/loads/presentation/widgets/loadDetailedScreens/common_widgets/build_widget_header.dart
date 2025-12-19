import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';

Widget buildWidgetHeaderOnTrip({
  required IconData icon,
  required String name,
  required Widget child,
}) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  padding: const EdgeInsets.all(20),
  decoration: _buildCardDecoration(),
  child: Column(
    children: [
      Row(
          children: [
            _buildHeaderIcon(icon),
            const SizedBox(width: 12),
            Text(
              name,
              style: AppTextStyles.headlineMedium(),
            ),
            const Spacer(),
            // if (load.distance != null) _buildDistanceBadge(),
          ],
        ),
      child
    ],
  ),
  );
}
BoxDecoration _buildCardDecoration() {
  return BoxDecoration(
    color: AppColors.cardColor,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: AppColors.borderColor),
    boxShadow: [
      BoxShadow(
        color: AppColors.textMuted.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
Widget _buildHeaderIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Icon(
      icon,

      color: AppColors.primaryColor,
      size: 24,
    ),
  );
}