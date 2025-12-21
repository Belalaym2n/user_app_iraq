import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
 import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';

import '../../../../../../core/utils/app_constants.dart';
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
    final distanceKm = calculateDistanceInKm(
      startLat: load.pickupLat,
      startLng: load.pickupLng,
      endLat: load.destinationLat,
      endLng: load.destinationLng,
    );

    return Container(
      padding: EdgeInsets.all(
        AppConstants.w * 0.044, // 16 / 360
      ),
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
          SizedBox(width: AppConstants.w * 0.033), // 12 / 360
          Expanded(
            child: _StatCard(
              icon: Icons.gavel_rounded,
              label: LocaleKeys.MyLoadsScreen_receivedBids.tr(),
              value: load.offers.length.toString(),
              color: AppColors.infoColor,
            ),
          ),
          SizedBox(width: AppConstants.w * 0.033), // 12 / 360
          Expanded(
            child: _StatCard(
              icon: Icons.route_rounded,
              label: LocaleKeys.Add_Load_kilometer.tr(),
              value: _formatDistance(distanceKm),
              color: AppColors.warningColor,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    return 'د.ع ${amount.toStringAsFixed(0)}';
  }

  double calculateDistanceInKm({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    const double earthRadius = 6371;

    double dLat = _degToRad(endLat - startLat);
    double dLng = _degToRad(endLng - startLng);

    double a =
        sin(dLat / 2) * sin(dLat / 2) +
            cos(_degToRad(startLat)) *
                cos(_degToRad(endLat)) *
                sin(dLng / 2) *
                sin(dLng / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _degToRad(double deg) {
    return deg * (pi / 180);
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
      padding: EdgeInsets.all(
        AppConstants.w * 0.033, // 12 / 360
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          AppConstants.w * 0.033, // 12 / 360
        ),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: AppConstants.w * 0.003, // 1 / 360
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: AppConstants.w * 0.066, // 24 / 360
          ),
          SizedBox(height: AppConstants.h * 0.010), // 8 / 776
          Text(
            value,
            style: AppTextStyles.headlineMedium().copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppConstants.h * 0.005), // 4 / 776
          Text(
            label,
            style: AppTextStyles.bodySmall().copyWith(
              color: AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
