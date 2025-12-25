import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';

import '../../../../../complaint/presentation/pages/complaint_page.dart';
import '../../../../../rate/presentation/pages/rate_screen_page.dart';
import '../../../../data/models/last_trip_model.dart';
import '../loadDetailsButton/loadDetailsButton.dart';
import 'build_header.dart' show EnhancedSliverAppBar;
import 'build_time_line_widget.dart';
import 'build_track_widget.dart';
import 'quick_states_buttons.dart';
import 'route_card.dart';

class LoadDetailsWrapper extends StatelessWidget {
  LoadDetailsWrapper({
    super.key,
    required this.childWidget,
    required this.loadModel,
    required this.getStatusColor,
  });

  final Color Function(TripStatus) getStatusColor;

  TripDetailsModel loadModel;
  Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: AppConstants.h * 0.85,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EnhancedSliverAppBar(
                    load: loadModel,

                    getStatusColor: getStatusColor,
                    getStatusIcon: get_status_icon,
                  ),

                  QuickStatsSection(load: loadModel),
                  withoutTacking(
                    loadModel.status == TripStatus.pending ||
                        TripStatus.cancelled == loadModel.status ||
                        loadModel.status == TripStatus.accepted ||
                        loadModel.status == TripStatus.completed,
                  ),
                ],
              ),
            ),
          ),

          LoadBottomActionBar(
            onTrackTrip: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComplaintScreen(),
                ),
              );
            },
            onRate: () async {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => RatingBottomSheet(
                  tripId: 232,
                  tripTitle: 'Trip to Basra', // Optional
                ),
              ).then((value) {
                if (value == true) {
                  // Rating submitted successfully
                  print('Rating submitted!');
                }
              });
            },

            status: loadModel.status,
          ),
        ],
      ),
    );
  }

  Widget withoutTacking(bool isTrack) {
    return Column(
      children: [
        if (!isTrack) LoadLiveTracking(),

        EnhancedRouteCard(load: loadModel),
        TripTimelineScreen(tripDetailsModel: loadModel),
        childWidget,
      ],
    );
  }

  IconData get_status_icon(status) {
    switch (status) {
      case "pending":
        return Icons.access_time_filled_rounded;
      case "in_progress":
        return Icons.local_shipping_rounded;
      case "completed":
        return Icons.check_circle_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }
}
