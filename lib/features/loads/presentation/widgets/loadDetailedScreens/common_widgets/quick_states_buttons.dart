import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
 import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/last_trip_model.dart';

class QuickStatsSection extends StatelessWidget {
  final TripDetailsModel load;

  const QuickStatsSection({
    Key? key,
    required this.load,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.attach_money_rounded,
              label: LocaleKeys.MyLoadsScreen_loadBudget.tr(),
              value: _formatCurrency(load.basePrice),
              color: AppColors.successColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.gavel_rounded,
              label: LocaleKeys.MyLoadsScreen_receivedBids.tr(),
              value: load.offers.length.toString(),
              color: AppColors.infoColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.route_rounded,
              label: LocaleKeys.Add_Load_kilometer.tr(),
              value: _formatDistance(324),//load.distance),
              color: AppColors.warningColor,
            ),
          ),
          const SizedBox(width: 12),

        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    return 'د.ع ${amount.toStringAsFixed(0)}';
  }

  String _formatDistance(double? distance) {
    if (distance == null) return LocaleKeys.MyLoadsScreen_naKm.tr();
    return '${distance.toStringAsFixed(0)} ${LocaleKeys.Add_Load_kilometer.tr()}';
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _buildCardDecoration(),
      child: Column(
        children: [
          _buildIcon(),
          const SizedBox(height: 8),
          _buildValue(),
          const SizedBox(height: 4),
          _buildLabel(),
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: color.withOpacity(0.3),
        width: 1,
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      icon,
      color: color,
      size: 24,
    );
  }

  Widget _buildValue() {
    return Text(
      value,
      style: AppTextStyles.headlineMedium().copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLabel() {
    return Text(
      label,
      style: AppTextStyles.bodySmall().copyWith(
        color: AppColors.textMuted,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}