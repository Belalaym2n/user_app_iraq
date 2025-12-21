import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart'
    show TripModel, TripStatus;

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart'
    show TripModel, TripStatus;

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';

class EnhancedRouteCard extends StatelessWidget {
  final TripModel load;

  const EnhancedRouteCard({Key? key, required this.load}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = AppConstants.w;
    final double h = AppConstants.h;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: w * 0.044, // 16 / 360
        vertical: h * 0.010,   // 8 / 777
      ),
      padding: EdgeInsets.all(
        w * 0.055, // 20 / 360
      ),
      decoration: _buildCardDecoration(w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(w),
          SizedBox(height: h * 0.026), // 20 / 777
          _buildRouteTimeline(w, h),
        ],
      ),
    );
  }

  // ================= Card Decoration =================

  BoxDecoration _buildCardDecoration(double w) {
    return BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(
        w * 0.055, // 20 / 360
      ),
      border: Border.all(color: AppColors.borderColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.05),
          blurRadius: w * 0.028, // 10 / 360
          offset: Offset(
            0,
            w * 0.011, // 4 / 360
          ),
        ),
      ],
    );
  }

  // ================= Header =================

  Widget _buildHeader(double w) {
    return Row(
      children: [
        _buildHeaderIcon(w),
        SizedBox(width: w * 0.033), // 12 / 360
        Text(
          LocaleKeys.MyLoadsScreen_routeDetails.tr(),
          style: AppTextStyles.headlineMedium(),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildHeaderIcon(double w) {
    return Container(
      padding: EdgeInsets.all(
        w * 0.028, // 10 / 360
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          w * 0.033, // 12 / 360
        ),
      ),
      child: Icon(
        Icons.route_rounded,
        color: AppColors.primaryColor,
        size: w * 0.067, // 24 / 360
      ),
    );
  }

  // ================= Route Timeline =================

  Widget _buildRouteTimeline(double w, double h) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimelineLine(w, h),
        SizedBox(width: w * 0.044), // 16 / 360
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LocationInfo(
                label: LocaleKeys.MyLoadsScreen_pickup.tr(),
                location: load.pickupAddress,
                date: load.pickupDate ?? DateTime.now(),
                isCompleted: _isPickupCompleted,
              ),
              SizedBox(height: h * 0.062), // 48 / 777
              _LocationInfo(
                label: LocaleKeys.MyLoadsScreen_delivery.tr(),
                location: load.destinationAddress,
                date: load.destinationDate ??
                    DateTime.now().add(const Duration(days: 2)),
                isCompleted: _isDeliveryCompleted,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineLine(double w, double h) {
    return Column(
      children: [
        _buildTimelineCircle(
          color: AppColors.successColor,
          icon: Icons.radio_button_checked,
          w: w,
        ),
        _buildTimelineConnector(w, h),
        _buildTimelineCircle(
          color: AppColors.errorColor,
          icon: Icons.flag_rounded,
          w: w,
        ),
      ],
    );
  }

  Widget _buildTimelineCircle({
    required Color color,
    required IconData icon,
    required double w,
  }) {
    return Container(
      width: w * 0.067, // 24 / 360
      height: w * 0.067, // 24 / 360
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(
        icon,
        color: Colors.white,
        size: w * 0.044, // 16 / 360
      ),
    );
  }

  Widget _buildTimelineConnector(double w, double h) {
    return Container(
      width: w * 0.006, // 2 / 360
      height: h * 0.103, // 80 / 777
      margin: EdgeInsets.symmetric(
        vertical: h * 0.005, // 4 / 777
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.successColor,
            AppColors.errorColor,
          ],
        ),
      ),
    );
  }

  // ================= Helpers =================

  bool get _isPickupCompleted =>
      load.status == TripStatus.started ||
          load.status == TripStatus.completed;

  bool get _isDeliveryCompleted =>
      load.status == TripStatus.completed;
}


class _LocationInfo extends StatelessWidget {
  final String label;
  final String location;
  final DateTime date;
  final bool isCompleted;

  const _LocationInfo({
    Key? key,
    required this.label,
    required this.location,
    required this.date,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelRow(w),
        SizedBox(height: h * 0.005), // 4 / 777
        _buildLocationText(),
        SizedBox(height: h * 0.005), // 4 / 777
        _buildDateTimeRow(w),
      ],
    );
  }

  // ================= Label Row =================

  Widget _buildLabelRow(double w) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.labelLarge().copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (isCompleted) ...[
          SizedBox(width: w * 0.022), // 8 / 360
          _buildCompletedBadge(w),
        ],
      ],
    );
  }

  // ================= Completed Badge =================

  Widget _buildCompletedBadge(double w) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.022, // 8 / 360
        vertical: w * 0.006,   // 2 / 360
      ),
      decoration: BoxDecoration(
        color: AppColors.successColor.withOpacity(0.1), // 10%
        borderRadius: BorderRadius.circular(
          w * 0.033, // 12 / 360
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: AppColors.successColor,
            size: w * 0.033, // 12 / 360
          ),
          SizedBox(width: w * 0.011), // 4 / 360
          Text(
            LocaleKeys.MyLoadsScreen_completed.tr(),
            style: AppTextStyles.bodySmall().copyWith(
              color: AppColors.successColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ================= Location =================

  Widget _buildLocationText() {
    return Text(
      location,
      style: AppTextStyles.headlineSmall(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // ================= Date & Time =================

  Widget _buildDateTimeRow(double w) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today_rounded,
          size: w * 0.033, // 12 / 360
          color: AppColors.textMuted,
        ),
        SizedBox(width: w * 0.011), // 4 / 360
        Text(
          DateFormat('MMM dd, yyyy').format(date),
          style: AppTextStyles.bodySmall(),
        ),
        SizedBox(width: w * 0.022), // 8 / 360
        Icon(
          Icons.access_time_rounded,
          size: w * 0.033, // 12 / 360
          color: AppColors.textMuted,
        ),
        SizedBox(width: w * 0.011), // 4 / 360
        Text(
          DateFormat('HH:mm').format(date),
          style: AppTextStyles.bodySmall(),
        ),
      ],
    );
  }
}
