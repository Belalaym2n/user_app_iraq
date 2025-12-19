import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../data/models/last_trip_model.dart' show TripModel;
 import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
 import '../common_widgets/load_wrapper.dart';

typedef ViewLoadCallback = void Function(TripModel load);

class EnhancedLoadCard extends StatelessWidget {
  final TripModel load;
  final int index;
  final ThemeData theme;
  final ViewLoadCallback onViewDetails;
  final String Function(String key) tr;
  VoidCallbackAction onConfirmCancel;
    EnhancedLoadCard({
    Key? key,
    required this.load,
    required this.index,
    required this.theme,
    required this.onConfirmCancel,
    required this.onViewDetails,
    required this.tr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LoadWrapper(
      load: load,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onViewDetails(load),
        child: Column(
          children: [
            const SizedBox(height: 16),

            // EnhancedBidsSection(
            //   bid: load,
            //   primaryColor: AppColors.primaryColor,
            //
            //   theme: Theme.of(context),
            // ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(child: ViewDetailsButton(                tripModel: load,
                )),

                const SizedBox(width: 16),
                Expanded(
                  child: buildStatusBasedActionButton(
                      onConfirmCancel: (){
                        onConfirmCancel;
                      },
                      load, context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
