import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../data/models/offers_model.dart' show OfferModel;

class BidInfoSection extends StatelessWidget {
  final OfferModel bid;

  const BidInfoSection({
    required this.bid,
   });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bid.driver.user.name.isNotEmpty ?      bid.driver.user.name : 'Unknown Transporter',
          style: AppTextStyles.bodyMedium().copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star_rounded, size: 14, color: AppColors.warningColor),
            const SizedBox(width: 4),
            Text(
              bid.driver.rating.toStringAsFixed(1),
              style: AppTextStyles.bodySmall().copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

