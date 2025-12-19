import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../data/models/last_trip_model.dart';

// improt 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart'
class LoadHeader extends StatelessWidget {
  final TripModel load;

  const LoadHeader({
    Key? key,
    required this.load,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayId = load.id.toString().length > 8
        ? load.id.toString().substring(0, 8).toUpperCase()
        : load.id.toString().toUpperCase();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LoadTitleRow(
                title:" load.title",
                tr: tr,
              ),
              SizedBox(height: AppConstants.h * 0.010),
              _LoadIdBadge(displayId: displayId),
            ],
          ),
        ),
        SizedBox(width: AppConstants.w * 0.022),
        _LoadPriceBadge(budget: load.basePrice),
      ],
    );
  }
}

class _LoadTitleRow extends StatelessWidget {
  final String title;
  final String Function(String key) tr;

  const _LoadTitleRow({
    required this.title,
    required this.tr,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium().copyWith(
              fontSize: AppConstants.w * 0.044,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _LoadIdBadge extends StatelessWidget {
  final String displayId;

  const _LoadIdBadge({
    required this.displayId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.022,
        vertical: AppConstants.h * 0.005,
      ),
      decoration: BoxDecoration(
        color:
        AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.022),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.2),
        ),
      ),
      child: Text(
        "${LocaleKeys.MyLoadsScreen_load.tr()} #$displayId 23234".trim(),
        style: AppTextStyles.bodyLarge().copyWith(
          fontSize: AppConstants.w * 0.034,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _LoadPriceBadge extends StatelessWidget {
  final double budget;

  const _LoadPriceBadge({
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.02,
        vertical: AppConstants.h * 0.01,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.successColor.withOpacity(0.15),
            AppColors.successColor.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
        border: Border.all(
          color: AppColors.successColor.withOpacity(0.3),
        ),
      ),
      child: Text(
        'د.ع ${budget.toStringAsFixed(0)}',
        style: AppTextStyles.bodyLarge().copyWith(
          fontSize: AppConstants.w * 0.030,
          fontWeight: FontWeight.w700,
          color: AppColors.successColor,
        ),
      ),
    );
  }
}
