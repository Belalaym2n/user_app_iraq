import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';

import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loadTypes/common_widgets/load_details.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../data/models/last_trip_model.dart' show TripModel;
import '../../../../pages/load_detsils_screen.dart';

class ViewDetailsButton extends StatelessWidget {
    ViewDetailsButton({super.key,required this.tripModel,  this.buttonName});
  TripModel tripModel;
  String ?buttonName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(AppConstants.w * 0.033),
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.2),
              ),
            ),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoadDetailsScreen
                  (tripModel: tripModel
                ),));
              },
              icon: Icon(
                Icons.visibility_rounded,
                size: AppConstants.w * 0.045,
              ),
              label: Text(
    buttonName==null?
    LocaleKeys.MyLoadsScreen_viewDetails.tr():buttonName!,
                style: TextStyle(
                  fontSize: AppConstants.w * 0.036,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  vertical: AppConstants.h * 0.015,
                ),
                side: BorderSide.none,
                foregroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppConstants.w * 0.033),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
