
import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../data/models/offers_model.dart';
import 'build_avatar.dart';
import 'offer_actions.dart';
import 'offer_info.dart';

class BidPreviewCard extends StatelessWidget {
  final OfferModel bid;

  const BidPreviewCard({
    required this.bid,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.h*0.12 ,
      padding:   EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.infoColor.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          BidAvatar(letter: _firstLetter(     bid.driver.user.name)),

          const SizedBox(width: 12),

          Expanded(
            child: BidInfoSection(
              bid: bid,
             ),
          ),

          BidActions(
            bid: bid,
          ),

        ],
      ),
    );
  }

  String _firstLetter(String name) {
    if (name.isEmpty) return '?';
    return name[0].toUpperCase();
  }
}
