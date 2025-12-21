import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../generated/locale_keys.g.dart' show LocaleKeys;

class BidsSectionHeader extends StatelessWidget {
  final int bidCount;
  bool isDetails;
  bool isAccepted;

  BidsSectionHeader({required this.bidCount,this.isAccepted=false, this.isDetails = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.gavel_rounded,
                size: 16,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.MyLoadsScreen_bidManagement.tr(),
              style: AppTextStyles.titleMedium().copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),

        Spacer(),
        if(isDetails==false)
        _BidCounterChip(count: bidCount, primaryColor: AppColors.primaryColor),

        if (isDetails&&isAccepted==false)
          TextButton(
            onPressed: () {
              print("View All");
            },
            child: Text(
              LocaleKeys.MyLoadsScreen_viewBids.tr(),
              style: AppTextStyles.titleMedium().copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        if (isDetails&& isAccepted==false)
          _BidCounterChip(
            count: bidCount,
            primaryColor: AppColors.primaryColor,
          ),
      ],
    );
  }
}

class _BidCounterChip extends StatelessWidget {
  final int count;
  final Color primaryColor;

  const _BidCounterChip({required this.count, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: AppTextStyles.bodySmall().copyWith(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
