import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';

class BidItem extends StatelessWidget {
  final OfferModel offerModel;

  const BidItem({required this.offerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.h*0.14,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            child: Text(
              offerModel.driver.user.name.isNotEmpty
                  ? offerModel.driver.user.name[0].toUpperCase()
                  : '',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppConstants.w*0.3,
                    child: Text(
                      overflow: TextOverflow.ellipsis,

                      offerModel.driver?.user.name ?? '',
                      style: AppTextStyles.headlineSmall(),
                    ),
                  ),
                  Text(
                    "⭐ ${offerModel.driver?.rating ?? ''}  |  ${offerModel.driver.totalRides ?? ""} trips",
                  ),
                ],
              ),
            ),
          ),
          Text(
            "${offerModel.offeredPrice.toStringAsFixed(0)} د.ع",
            style: AppTextStyles.headlineMedium(),
          ),
        ],
      ),
    );
  }
}
