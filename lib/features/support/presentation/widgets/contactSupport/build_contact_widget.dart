import 'package:flutter/material.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';

Widget buildContactOption({
  required String title,
  required String subtitle,
  required IconData icon,
  required Color iconColor,
  required bool enabled,
  required VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: enabled ? onTap : null,
    child: Container(
      height: 95,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: enabled ? Colors.white : Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: iconColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.bodyMedium().copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall().copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
