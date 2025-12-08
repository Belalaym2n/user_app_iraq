import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/load_model.dart' show LoadModel;
 class RouteInfo extends StatelessWidget {
  final LoadModel load;
  final ThemeData theme;

  const RouteInfo({
    Key? key,
    required this.load,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.04),
            AppColors.primaryColor.withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:  AppColors.primaryColor  .withOpacity(0.08),
        ),

      ),
      child: Row(
        children: [
          const _RouteTimeline(),
          const SizedBox(width: 16),
          Expanded(
            child: _RoutePoints(
              pickup: load.pickupLocation,
              delivery: load.deliveryLocation,
              theme: theme,
            ),
          ),
          const SizedBox(width: 12),

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
          width: 2,
          height: 28,
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
      width: 12,
      height: 12,
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
  final ThemeData theme;

  const _RoutePoints({
    required this.pickup,
    required this.delivery,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LocationPill(text: pickup, theme: theme),
        const SizedBox(height: 16),
        _LocationPill(text: delivery, theme: theme),
      ],
    );
  }
}

class _LocationPill extends StatelessWidget {
  final String text;
  final ThemeData theme;

  const _LocationPill({
    required this.text,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor ,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.bodyMedium().copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}

