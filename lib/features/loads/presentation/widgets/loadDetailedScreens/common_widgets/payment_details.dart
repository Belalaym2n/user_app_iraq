import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/common_widgets/build_widget_header.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class TripPaymentDetails extends StatelessWidget {
  TripPaymentDetails({super.key, required this.tripDetailsModel});

  TripDetailsModel tripDetailsModel;

  @override
  Widget build(BuildContext context) {
    return buildWidgetHeaderOnTrip(
      icon: FontAwesomeIcons.moneyBill,
      name: LocaleKeys.MyLoadsScreen_paymentDetails.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.h * 0.02),
          _buildEnhancedPaymentCard(),
        ],
      ),
    );
  }

  Widget _buildEnhancedPaymentCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.MyLoadsScreen_loadBudget.tr()),
            Spacer(),
            Text(
              tripDetailsModel.basePrice.toString(),
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
