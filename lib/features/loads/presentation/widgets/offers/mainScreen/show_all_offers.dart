import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/widgets/bidsDesign/bid_item.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../data/models/last_trip_model.dart';
import '../../loads_screens/loadTypes/buttons/view_details_button.dart';
import '../common/driver_preview.dart';
import 'offer_header.dart';

class ShowAllOffersOnMainScreen extends StatelessWidget {
  ShowAllOffersOnMainScreen({
    super.key,
    required this.tripModel,
    required this.offers,
  });

  List<OfferModel> offers;
  TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) {
      return SizedBox.shrink();
    } else {
      return SizedBox(
        height:
            tripModel.status == TripStatus.pending &&
                tripModel.offers.isNotEmpty
            ? AppConstants.h * 0.31
            : AppConstants.h * 0.23,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor.withOpacity(0.08),
                AppColors.primaryColor.withOpacity(0.03),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryColor.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              BidsSectionHeader(bidCount: offers.length),

              SizedBox(height: AppConstants.h * 0.01),

              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, i) {
                    return BidPreviewCard(bid: offers[i]);
                  },
                ),
              ),
              SizedBox(height: 0),
              if (tripModel.status == TripStatus.pending)
                ViewDetailsButton(
                  buttonName: "View All Offers",
                  tripModel: tripModel,
                ),
            ],
          ),
        ),
      );
    }
  }
}
