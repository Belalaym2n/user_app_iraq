import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';

import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../data/models/offers_model.dart';
import '../../../offers/detailsScreen/offers_on_details_screen.dart';
import '../../../offers/driverDetails/driverAccepted.dart';
import '../../common_widgets/build_time_line_widget.dart';
import '../../common_widgets/contact_driver_hidden.dart';
import '../../common_widgets/load_info.dart';
import '../../common_widgets/payment_details.dart';
import '../bidsDesign/no_bids.dart';
class CompletedDesign extends StatelessWidget {
    CompletedDesign({super.key ,    required this.offerModel,
    required this.tripDetailsModel});
  TripDetailsModel tripDetailsModel;
  OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        DriverAccepted(offerModel:  offerModel,),
        SizedBox(
          height: AppConstants.h*0.04,
        ),
        LoadInfo(load: tripDetailsModel),
        SizedBox(
          height: AppConstants.h*0.04,
        ),
        TripPaymentDetails(
          tripDetailsModel: tripDetailsModel ,
        ),
        SizedBox(
          height: AppConstants.h*0.04,
        ),
        ContactDriver(
          offerModel:  offerModel ,

          isHidden: false,
        ),
        SizedBox(
          height: AppConstants.h*0.04,
        ),
      ],
    );
  }
}

