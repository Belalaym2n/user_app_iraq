import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../data/models/last_trip_model.dart' show TripModel;
 import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';
import '../bids_section.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';

class CompletedLoad extends StatelessWidget {
      CompletedLoad({super.key,required this.tripModel});
  TripModel tripModel;

  @override
  Widget build(BuildContext context) {
     return LoadWrapper(
        load: tripModel,
        child: InkWell(
        borderRadius: BorderRadius.circular(20),
    onTap: () {

    },
    child:Column(
      children: [
        SizedBox(
          height: AppConstants.h*0.02,
        ),
        // EnhancedBidsSection(
        //   bid: fakeBid,
        //   primaryColor: AppColors.primaryColor,
        //
        //   theme: Theme.of(context),
        // ),
        const SizedBox(height: 16),

        Row(children: [Expanded(child: ViewDetailsButton(                tripModel: tripModel,
        ))]),
        SizedBox(
          height: AppConstants.h*0.025,
        ),
        buildEnhancedLoadStatus(
            tripModel
        )      ],
    )));
  }
}
