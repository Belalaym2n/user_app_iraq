import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';

import '../../../../data/models/last_trip_model.dart';
import 'build_header.dart' show EnhancedSliverAppBar;
import 'quick_states_buttons.dart';
import 'route_card.dart';

class LoadDetailsWrapper extends StatelessWidget {
  LoadDetailsWrapper({
    super.key,
    required this.childWidget,
    required this.loadModel,
  });

  TripDetailsModel loadModel;
  Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EnhancedSliverAppBar(
            load: loadModel,

            getStatusColor: (dynamic) => Colors.green,
            getStatusIcon: get_status_icon,
          ),

          QuickStatsSection(load: loadModel),
          EnhancedRouteCard(load: loadModel),
          childWidget,
        ],
      ),
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
