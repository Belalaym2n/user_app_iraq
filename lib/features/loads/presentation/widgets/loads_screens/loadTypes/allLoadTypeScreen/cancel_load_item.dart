
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../data/models/last_trip_model.dart' show TripModel;
import '../../../loadDetailedScreens/widgets/bidsDesign/bid_item.dart';
import '../../../offers/mainScreen/show_all_offers.dart';
import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';

class CancelLoadItem extends StatelessWidget {
    CancelLoadItem({super.key,required this.tripModel});
TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return LoadWrapper(
      load: tripModel,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {

        },
        child: Column(children: [
          SizedBox(
            height: AppConstants.h*0.02,
          ),
          ShowAllOffersOnMainScreen(
            tripModel: tripModel,

            offers: tripModel.offers,
          ),
          Row(
            children: [
              Expanded(child: ViewDetailsButton(
                tripModel: tripModel,
              )),
              const SizedBox(width: 16),

            ],
          ),

          SizedBox(
            height: AppConstants.h*0.02,
          ),
          buildEnhancedLoadStatus(
              tripModel
          )
        ]),
      ),
    );
  }
}
