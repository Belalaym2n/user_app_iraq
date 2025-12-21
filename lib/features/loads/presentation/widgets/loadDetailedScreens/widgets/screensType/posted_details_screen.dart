 import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';

import '../../../../../../../core/utils/app_constants.dart';
import '../../../offers/detailsScreen/offers_on_details_screen.dart';
import '../../common_widgets/build_time_line_widget.dart';
import '../../common_widgets/contact_driver_hidden.dart';
import '../../common_widgets/load_info.dart';
import '../../common_widgets/payment_details.dart';
import '../bidsDesign/no_bids.dart';

class PostedDetailsScreen extends StatelessWidget {
     PostedDetailsScreen({super.key,required this.tripDetailsModel});
TripDetailsModel tripDetailsModel;
   @override
   Widget build(BuildContext context) {
     return  Column(
       children: [
         OffersOnDetailsScreen(
           tripModel: tripDetailsModel,
           offers: tripDetailsModel.offers,
         ),
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
           isHidden: true,
          ),
         SizedBox(
           height: AppConstants.h*0.04,
         ),
       ],
     );
   }
 }
