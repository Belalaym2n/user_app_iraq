import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
 import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/models/last_trip_model.dart';

class RouteInfo extends StatelessWidget {
  final TripModel load;

  const RouteInfo({
    Key? key,
    required this.load,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.w * 0.044),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.04),
            AppColors.primaryColor.withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.044),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.08),
        ),
      ),
      child: Row(
        children: [
          const _RouteTimeline(),
          SizedBox(width: AppConstants.w * 0.044),
          Expanded(
            child: _RoutePoints(
              pickup: load.pickupAddress,
              delivery: load.destinationAddress,
            ),
          ),
          SizedBox(width: AppConstants.w * 0.033),
        ],
      ),
    );
  }
}

class _RouteTimeline extends StatelessWidget {
  const _RouteTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RouteDot(isStart: true),
        Container(
          width: AppConstants.w * 0.005,
          height: AppConstants.h * 0.035,
          color: AppColors.primaryColor.withOpacity(0.3),
        ),
        _RouteDot(isStart: false),
      ],
    );
  }
}

class _RouteDot extends StatelessWidget {
  final bool isStart;

  const _RouteDot({required this.isStart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.w * 0.033,
      height: AppConstants.w * 0.033,
      decoration: BoxDecoration(
        color: isStart ? AppColors.successColor : AppColors.errorColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _RoutePoints extends StatelessWidget {
  final String pickup;
  final String delivery;

  const _RoutePoints({
    required this.pickup,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LocationPill(text: pickup),
        SizedBox(height: AppConstants.h * 0.020),
        _LocationPill(text: delivery),
      ],
    );
  }
}

class _LocationPill extends StatelessWidget {
  final String text;

  const _LocationPill({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.022,
        vertical: AppConstants.h * 0.007,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(AppConstants.w * 0.022),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.bodyMedium().copyWith(
          fontSize: AppConstants.w * 0.032,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
