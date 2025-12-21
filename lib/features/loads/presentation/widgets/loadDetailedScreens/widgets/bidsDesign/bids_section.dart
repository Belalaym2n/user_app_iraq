import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';
import 'accept_bid.dart';
import 'bid_item.dart';
import 'no_bids.dart';

class EnhancedBidsSectionOnScreenDetailed extends StatelessWidget {
  final OfferModel offer;

  const EnhancedBidsSectionOnScreenDetailed({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bids", style: AppTextStyles.headlineMedium()),
          const SizedBox(height: 12),
          _buildBidsContent(),
        ],
      ),
    );
  }

  Widget _buildBidsContent() {
    if (offer.isNull) return const NoBidsWidget();

    return BidItem(offerModel: offer);
  }
}
