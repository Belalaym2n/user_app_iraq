import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/widgets/bidsDesign/no_bids.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loadTypes/load_details.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';

import '../../../../data/models/last_trip_model.dart';
import '../../../../data/models/trip_status.dart';
import '../common_widgets/contact_driver_hidden.dart';
import '../common_widgets/load_details_wrapper.dart';
import '../common_widgets/build_time_line_widget.dart';
import '../common_widgets/load_info.dart';
import '../common_widgets/payment_details.dart';

class LoadDetailedScreenItem extends StatelessWidget {
  final TripDetailsModel load;
  final IconData Function(String) getStatusIcon; // ✅

    LoadDetailedScreenItem({
    Key? key,
    required this.load,
    required this.getStatusIcon,
  }) : super(key: key);

  // في الـ Controller
  final timelineEvents = <TimelineEvent>[
    TimelineEvent(
      title: LocaleKeys.MyLoadsScreen_loadPosted.tr(),
      description: 'Your load has been posted successfully',
      status: TripStatus.pending,
      icon: Icons.check_circle_rounded,
      timestamp: DateTime.now().subtract(Duration(days: 2)),
    ),
  ].obs;

  // في الـ Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadDetailsWrapper(
        loadModel: load,
        childWidget: SingleChildScrollView(
          child: Column(
            children: [
              TripTimelineScreen(tripDetailsModel: load),
           NoBidsWidget(),
              SizedBox(
                height: AppConstants.h*0.04,
              ),
              LoadInfo(load: load),
              SizedBox(
                height: AppConstants.h*0.04,
              ),
              TripPaymentDetails(
                tripDetailsModel: load ,
              ),
              SizedBox(
                height: AppConstants.h*0.04,
              ),
              ContactDriverHidden(),
              SizedBox(
                height: AppConstants.h*0.04,
              ),
            ],
          ), // في الـ Screen
          // EnhancedLoadDetailsCardSectionOnScreen(load: widget.load,
        ),
      ),
    );
  }
}

Color _getStatusColor(dynamic status) {
  switch (status.toString().toLowerCase()) {
    case 'active':
      return AppColors.successColor;
    case 'pending':
      return AppColors.warningColor;
    case 'completed':
      return AppColors.primaryColor;
    default:
      return AppColors.infoColor;
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
