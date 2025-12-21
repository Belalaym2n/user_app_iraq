import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/buttons.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../offers/common/driver_preview.dart';
import 'build_widget_header.dart';

class DriverInfoScreen extends StatelessWidget {
    DriverInfoScreen({super.key,required this.offerModel});
OfferModel offerModel;
  @override
  Widget build(BuildContext context) {
    return   buildWidgetHeaderOnTrip(
        icon: Icons.gavel_rounded,
        name: LocaleKeys.MyLoadsScreen_driverDetails.tr(),
    child: Column(
    children: [
    SizedBox(height: AppConstants.h * 0.02),

      BidPreviewCard(bid:offerModel),
       large_button(

         color: AppColors.infoColor,
        icon: Icons.message,
        onPressed: (){}, buttonName: LocaleKeys.MyLoadsScreen_message.tr(),

      )

    ]));

  }
}
