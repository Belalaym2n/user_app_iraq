import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../data/models/last_trip_model.dart' show TripModel;
import '../../../offers/mainScreen/show_all_offers.dart';
import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';
import '../bids_section.dart';
import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';

class PostedLoad extends StatelessWidget {
  PostedLoad({
    super.key,
    required this.tripModel,
    required this.onConfirmCancel,
  });

  TripModel tripModel;
  VoidCallback onConfirmCancel;

  @override
  Widget build(BuildContext context) {
    return LoadWrapper(
      load: tripModel,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
         },
        child: Column(
          children: [
            ShowAllOffersOnMainScreen(
              tripModel: tripModel,
              offers: tripModel.offers,
            ),
            if (tripModel.offers.isNotEmpty)
              SizedBox(height: AppConstants.h * 0.02),
            Row(
              children: [
                Expanded(child: ViewDetailsButton(tripModel: tripModel)),

                const SizedBox(width: 16),

                Expanded(
                  child: buildStatusBasedActionButton(
                    onConfirmCancel: () {
                      onConfirmCancel();
                    },

                    tripModel,
                    context,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppConstants.h * 0.02),
            buildEnhancedLoadStatus(tripModel),
          ],
        ),
      ),
    );
  }
}
