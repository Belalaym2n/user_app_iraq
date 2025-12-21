import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/widgets/bidsDesign/no_bids.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/offers/detailsScreen/offers_buttons.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../addLoad/data/models/load_model.dart';
import '../../../../data/models/offers_model.dart';
import '../../loads_screens/loadTypes/buttons/view_details_button.dart';
import '../common/driver_preview.dart';
import '../mainScreen/offer_header.dart';

class OffersOnDetailsScreen extends StatelessWidget {
  OffersOnDetailsScreen({
    super.key,
    required this.tripModel,
    required this.offers,
  });

  List<OfferModel> offers;
  TripDetailsModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: cardDecoration,
      child: offers.isEmpty
          ? NoBidsWidget()
          : SizedBox(
              height: AppConstants.h * 0.27 ,
              child: Column(
                  children: [
                    BidsSectionHeader(

                        isDetails: true,
                        bidCount: offers.length),


                    Expanded(
                      child: ListView.builder(
                         itemCount: offers.length > 1 ? 2 : 1,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              BidPreviewCard(

                                   bid: offers[i]),
                              OffersButtons(
                                tripDetailsModel: tripModel,
                                offerModel: offers[i],
                              )
                            ],
                          );
                        },
                      ),
                    ),


                  ],
                ),
              ),

    );
  }}

  final cardDecoration = BoxDecoration(
    color: AppColors.cardColor,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: AppColors.borderColor),
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

