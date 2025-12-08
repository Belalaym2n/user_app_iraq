import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/features/loads/data/models/bids_model.dart' show BidModel;
import 'package:user_app_iraq/features/loads/data/models/load_model.dart' show LoadModel;

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../data/models/bids_status_model.dart';
import 'accept_bid.dart';
import 'bid_item.dart';
import 'no_bids.dart';

class EnhancedBidsSectionOnScreenDetailed extends StatelessWidget {
  final LoadModel load;
  final List<BidModel> loadBids;

  const EnhancedBidsSectionOnScreenDetailed({
    super.key,
    required this.load,
    required this.loadBids,
  });

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
    if (loadBids.isEmpty) return const NoBidsWidget();

    final acceptedList = loadBids.where((b) => b.status == BidStatus.accepted);
    if (acceptedList.isNotEmpty) {
      final acceptedBid = acceptedList.first;
      return AcceptedBidWidget(bid: acceptedBid);
    }

    return Column(
      children: loadBids.take(3).map((bid) => BidItem(bid: bid)).toList(),
    );
  }

}
