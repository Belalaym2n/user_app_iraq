import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/bids_model.dart';
import '../../../../data/models/bids_status_model.dart';
import '../../../../data/models/driver_info.dart';
import '../../../../data/models/load_model.dart';
import '../widgets/bidsDesign/bids_section.dart';
import '../widgets/build_header.dart';
import '../widgets/build_time_line_widget.dart';
 import '../widgets/loadDetails/load_details_screen.dart';
import '../widgets/quick_states_buttons.dart';
import '../widgets/route_card.dart';

class LoadDetailedScreenItem extends StatefulWidget {
  final LoadModel load;
  final IconData Function(dynamic) getStatusIcon;

  const LoadDetailedScreenItem({
    Key? key,
    required this.load,
    required this.getStatusIcon,
  }) : super(key: key);

  @override
  State<LoadDetailedScreenItem> createState() => _LoadDetailedScreenItemState();
}

class _LoadDetailedScreenItemState extends State<LoadDetailedScreenItem> {

  List<BidModel> _generateFakeBids() {
    return [
      BidModel(
          id: 'bid_001',
          loadId: widget.load.id,
          driverId: 'driver_001',
          driverName: 'أحمد محمد',
          driverRating: 4.8,
          completedTrips: 156,
          bidAmount: 45000,
          estimatedDelivery: DateTime.now().add(const Duration(days: 2)),
          notes: 'لدي شاحنة مناسبة ويمكنني التسليم في الموعد المحدد',
          status: BidStatus.pending,
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          driverInfo: DriverInfo(
            photoUrl: null,
            driverId: '',
            licenseNumber: 'sdf',

            phoneNumber: '+964 770 123 4567',
            name: 'شاحنة',
          ),
          estimatedPickup: DateTime.now(),
          updatedAt: DateTime.now()


      ),

    ];
  }

// في الـ Controller
  final timelineEvents = <TimelineEvent>[
    TimelineEvent(
      title: LocaleKeys.MyLoadsScreen_loadPosted.tr(),
      description: 'Your load has been posted successfully',
      status: 'Done',
      icon: Icons.check_circle_rounded,
      color: AppColors.successColor,
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      isCompleted: true,
    ),
    TimelineEvent(
      title: LocaleKeys.MyLoadsScreen_biddingStarted.tr(),
      description: 'Transporters are bidding on your load',
      icon: Icons.gavel_rounded,
      color: AppColors.infoColor,
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      isCompleted: true,
    ),
    TimelineEvent(
      title: LocaleKeys.MyLoadsScreen_transportAssigned.tr(),
      description: 'Waiting for transporter assignment',
      icon: Icons.local_shipping_rounded,
      color: AppColors.warningColor,
      timestamp: DateTime.now(),
      isCompleted: false,
    ),
  ].obs;

// في الـ Screen
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            EnhancedSliverAppBar(

                load: widget.load,

                getStatusColor: (dynamic) => Colors.green,
                getStatusIcon: widget.getStatusIcon
            ),

            QuickStatsSection(load: widget.load,),
            EnhancedRouteCard(load: widget.load,),
            // في الـ Controller


            // في الـ Screen
            EnhancedTimelineCard(
              load: widget.load,
              timelineEvents: timelineEvents,
              getStatusColor: (status) => _getStatusColor(status),
              calculateProgress: (status) => _calculateProgress(status),
              onViewAll: () {},
            ),
            // في الـ Screen
            EnhancedBidsSectionOnScreenDetailed(load: fakeLoad,
                  loadBids: _generateFakeBids(),),

                EnhancedLoadDetailsCardSectionOnScreen(load: widget.load,
                 


            )
          ],),
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

