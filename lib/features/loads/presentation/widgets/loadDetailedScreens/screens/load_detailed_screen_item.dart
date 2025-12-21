import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/widgets/bidsDesign/no_bids.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loadTypes/common_widgets/load_details.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';

import '../../../../data/models/last_trip_model.dart';
import '../../../../data/models/trip_status.dart';
import '../../../bloc/getTripsBloc/trips_status.dart';
import '../common_widgets/contact_driver_hidden.dart';
import '../common_widgets/load_details_wrapper.dart';
import '../common_widgets/build_time_line_widget.dart';
import '../common_widgets/load_info.dart';
import '../common_widgets/payment_details.dart';
import '../widgets/screensType/canceled_trip_screen.dart';
import '../widgets/screensType/completed_design.dart';
import '../widgets/screensType/posted_details_screen.dart';
import '../widgets/screensType/started_load_screen.dart';
import '../widgets/screensType/trip_accepted.dart';

class LoadDetailedScreenItem extends StatelessWidget {
  final TripDetailsModel load;
  OfferModel? offerModel;
  final IconData Function(String) getStatusIcon; // ✅

  LoadDetailedScreenItem({
    Key? key,
    required this.load,
    this.offerModel,
    required this.getStatusIcon,
  }) : super(key: key);

  // في الـ Controller

  // في الـ Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(toolbarHeight: 0, elevation: 0),
      body: LoadDetailsWrapper(
        getStatusColor: _getStatusColor,
        loadModel: load,
        childWidget: SingleChildScrollView(
          child: showScreenItemBaseOnStatus(
            load,
            load.status,
            offerModel,
          ), // في الـ Screen
          // EnhancedLoadDetailsCardSectionOnScreen(load: widget.load,
        ),
      ),
    );
  }
}

Widget showScreenItemBaseOnStatus(
  TripDetailsModel trip,
  TripStatus tripStatus,
  OfferModel? offerModel,
) {
  switch (tripStatus) {
    case TripStatus.pending:
      return PostedDetailsScreen(tripDetailsModel: trip);

    case TripStatus.started:
      return StartedLoadScreen(offerModel: offerModel!, tripDetailsModel: trip);
    case TripStatus.accepted:
      // TODO: Handle this case.
      return AcceptedTrip(offerModel: offerModel!, tripDetailsModel: trip);

    case TripStatus.completed:
      // TODO: Handle this case.
      return  CompletedDesign(offerModel: offerModel!, tripDetailsModel: trip);
    case TripStatus.cancelled:
      // TODO: Handle this case.
       return CanceledTripScreen( tripDetailsModel: trip);
  }
}

Color _getStatusColor(TripStatus tripStatus) {
  switch (tripStatus) {
    case TripStatus.completed:
      return AppColors.successColor;
    case TripStatus.pending || TripStatus.started || TripStatus.accepted:
      return AppColors.infoColor;
    case TripStatus.cancelled:
      return AppColors.errorColor;
  }
}

double _calculateProgress(dynamic status) {
  switch (status.toString().toLowerCase()) {
    case 'posted':
      return 0.2;
    case 'bidding':
      return 0.4;
    case 'assigned':
      return 0.6;
    case 'in_progress':
      return 0.8;
    case 'completed':
      return 1.0;
    default:
      return 0.0;
  }
}
