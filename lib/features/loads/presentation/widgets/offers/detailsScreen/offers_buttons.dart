import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show OutlinedButton, Icons, ElevatedButton, Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/bloc/get_trip_details/get_trip_details_bloc.dart';
import 'package:user_app_iraq/features/loads/presentation/bloc/get_trip_details/get_trip_details_event.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class OffersButtons extends StatelessWidget {
  OffersButtons({
    super.key,
    required this.tripDetailsModel,
    required this.offerModel,
  });

  OfferModel offerModel;
  TripDetailsModel tripDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _build_offer_button(true, context)),
        SizedBox(width: AppConstants.w * 0.02),
         Expanded(child: _build_offer_button(false, context)),
      ],
    );
  }

  _build_offer_button(bool isRejected, BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print("OFFER ${offerModel.id}");
        !isRejected
            ? context.read<TripDetailsBloc>().add(
                AcceptTripEvent(
                  tripId: tripDetailsModel.id,
                  offerID: offerModel.id,
                ),
              )
            : null;
      },
      icon: SizedBox(
        width: 14,
        height: 12,
        child: isRejected
            ? Icon(
        Icons.details,
                size: 16,
                color: AppColors.primaryColor,
              )
            : Icon(Icons.done),
      ),
      label: Text(
        style: TextStyle(
          color: isRejected ? AppColors.primaryColor : Colors.white,
        ),
        isRejected
            ? LocaleKeys.MyLoadsScreen_viewDetails.tr()
            : LocaleKeys.MyLoadsScreen_accepted.tr(),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(AppConstants.w * 0.3, AppConstants.h * 0.05),
        backgroundColor: isRejected
            ? Colors.transparent
            : AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
