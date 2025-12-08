import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/load_model.dart';
import '../../../../data/models/load_states.dart';

class EnhancedRouteCard extends StatelessWidget {
  final LoadModel load;

  const EnhancedRouteCard({
    Key? key,
    required this.load,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: _buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildRouteTimeline(),
          if (_hasSpecialInstructions) ...[
            const SizedBox(height: 16),
            _buildSpecialInstructionsCard(),
          ],
        ],
      ),
    );
  }

  // ============== Card Decoration ==============

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.borderColor,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // ============== Header ==============

  Widget _buildHeader() {
    return Row(
      children: [
        _buildHeaderIcon(),
        const SizedBox(width: 12),
        Text(
          LocaleKeys.MyLoadsScreen_routeDetails.tr(),
          style: AppTextStyles.headlineMedium(),
        ),
        const Spacer(),
        if (load.distance != null) _buildDistanceBadge(),
      ],
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.route_rounded,
        color: AppColors.primaryColor,
        size: 24,
      ),
    );
  }

  Widget _buildDistanceBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${load.distance!.toStringAsFixed(0)} ${LocaleKeys.Add_Load_kilometer.tr()}',
        style: AppTextStyles.labelLarge().copyWith(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ============== Route Timeline ==============

  Widget _buildRouteTimeline() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimelineLine(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LocationInfo(
                label: LocaleKeys.MyLoadsScreen_pickup.tr(),
                location: load.pickupLocation,
                date: load.pickupDate,
                isCompleted: _isPickupCompleted,
              ),
              const SizedBox(height: 48),
              _LocationInfo(
                label: LocaleKeys.MyLoadsScreen_delivery.tr(),
                location: load.deliveryLocation,
                date: load.deliveryDate,
                isCompleted: _isDeliveryCompleted,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineLine() {
    return Column(
      children: [
        _buildTimelineCircle(
          color: AppColors.successColor,
          icon: Icons.radio_button_checked,
        ),
        _buildTimelineConnector(),
        _buildTimelineCircle(
          color: AppColors.errorColor,
          icon: Icons.flag_rounded,
        ),
      ],
    );
  }

  Widget _buildTimelineCircle({
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildTimelineConnector() {
    return Container(
      width: 2,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 4),
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

  // ============== Special Instructions ==============

  Widget _buildSpecialInstructionsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.warningColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.warningColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppColors.warningColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.MyLoadsScreen_description.tr(),
                  style: AppTextStyles.labelLarge().copyWith(
                    color: AppColors.warningColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  load.specialInstructions!,
                  style: AppTextStyles.bodySmall().copyWith(
                    color: AppColors.warningColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============== Helpers ==============

  bool get _hasSpecialInstructions =>
      load.specialInstructions?.isNotEmpty == true;

  bool get _isPickupCompleted =>
      load.status == LoadStatus.inProgress ||
          load.status == LoadStatus.completed;

  bool get _isDeliveryCompleted => load.status == LoadStatus.completed;
}

// ============== Location Info Widget ==============

class _LocationInfo extends StatelessWidget {
  final String label;
  final String location;
  final DateTime? date;
  final bool isCompleted;

  const _LocationInfo({
    Key? key,
    required this.label,
    required this.location,
    this.date,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelRow(),
        const SizedBox(height: 4),
        _buildLocationText(),
        if (date != null) ...[
          const SizedBox(height: 4),
          _buildDateTimeRow(),
        ],
      ],
    );
  }

  Widget _buildLabelRow() {
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
          const SizedBox(width: 8),
          _buildCompletedBadge(),
        ],
      ],
    );
  }

  Widget _buildCompletedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.successColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: AppColors.successColor,
            size: 12,
          ),
          const SizedBox(width: 4),
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

  Widget _buildLocationText() {
    return Text(
      location,
      style: AppTextStyles.headlineSmall(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDateTimeRow() {
    return Row(
      children: [
        _buildDateSection(),
        const SizedBox(width: 8),
        _buildTimeSection(),
      ],
    );
  }

  Widget _buildDateSection() {
    return Row(
      children: [
        Icon(
          Icons.calendar_today_rounded,
          size: 12,
          color: AppColors.textMuted,
        ),
        const SizedBox(width: 4),
        Text(
          DateFormat('MMM dd, yyyy').format(date!),
          style: AppTextStyles.bodySmall(),
        ),
      ],
    );
  }

  Widget _buildTimeSection() {
    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: 12,
          color: AppColors.textMuted,
        ),
        const SizedBox(width: 4),
        Text(
          DateFormat('HH:mm').format(date!),
          style: AppTextStyles.bodySmall(),
        ),
      ],
    );
  }
}