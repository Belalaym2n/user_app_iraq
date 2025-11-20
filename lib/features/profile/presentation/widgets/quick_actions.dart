import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../core/utils/app_colors.dart';

class BuildQuickActions extends StatelessWidget {
  const BuildQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildQuickActions(context);
  }

  Widget _buildQuickActions(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              LocaleKeys.Profile_quick_actions.tr(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 16),

            // Chips
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildActionChip(
                  label: LocaleKeys.Profile_help_center.tr(),
                  icon: Icons.help_outline,
                  color: AppColors.infoColor,
                  onTap: () {},
                ),
                _buildActionChip(
                  label: LocaleKeys.Profile_support.tr(),
                  icon: Icons.headset_mic_outlined,
                  color: AppColors.primaryColor,
                  onTap: () {},
                ),
                _buildActionChip(
                  label: LocaleKeys.Profile_feedback.tr(),
                  icon: Icons.star_rate_outlined,
                  color: AppColors.warningColor,
                  onTap: () {},
                ),
                _buildActionChip(
                  label: LocaleKeys.Profile_share_app.tr(),
                  icon: Icons.share_outlined,
                  color: AppColors.secondaryColor,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),

    );
  }

  Widget _buildActionChip({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ActionChip(
      onPressed: onTap,
      backgroundColor: color.withOpacity(0.12),
      side: BorderSide(color: color.withOpacity(0.35)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      avatar: Icon(icon, color: color, size: 18),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
