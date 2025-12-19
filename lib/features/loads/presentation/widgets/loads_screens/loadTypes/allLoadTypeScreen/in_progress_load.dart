import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';

import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../data/models/last_trip_model.dart' show TripModel;
 import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';


class InProgressLoad extends StatelessWidget {
    InProgressLoad({super.key,

      required this.onConfirmCancel,
      required this.tripModel});
TripModel tripModel;
VoidCallbackAction onConfirmCancel;
  @override
  Widget build(BuildContext context) {
    return LoadWrapper(
      load:tripModel,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Column(
          children: [
            SizedBox(height: AppConstants.h * 0.02),
            Row(
              children: [
                Expanded(child: ViewDetailsButton(
                  tripModel: tripModel,

                )),

                const SizedBox(width: 16),
                Expanded(
                  child: buildStatusBasedActionButton(
                    onConfirmCancel: (){
                      onConfirmCancel;
                    },
               tripModel,
                    context,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppConstants.h * 0.02),
            buildEnhancedLoadStatus(
                tripModel
            ),
          ],
        ),
      ),
    );
  }
}
