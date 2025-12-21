import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../profile/data/models/profile_model.dart';
import '../../../../data/models/last_trip_model.dart' show TripModel;

import '../../../bloc/getTripsBloc/trips_bloc.dart';
import '../../../bloc/getTripsBloc/trips_events.dart';
import '../../../bloc/getTripsBloc/trips_status.dart';
import '../loadsTap/tabs_controller.dart';
import 'all_loads_item.dart';

class LoadsScreenItem extends StatefulWidget {
  LoadsScreenItem({super.key,required this.tripStatisticsModel,
    required this.trips, required this.selectedTab});

  final List<TripModel> trips;
  final TripsTab selectedTab;
  final TripStatisticsModel tripStatisticsModel;

  @override
  State<LoadsScreenItem> createState() => _LoadsScreenItemState();
}

class _LoadsScreenItemState extends State<LoadsScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppConstants.h * 0.02),
        TabControllerItem(
          tripStatisticsModel: widget.tripStatisticsModel,
          selectedTab: widget.selectedTab,
          trips: widget.trips,
          onTabChanged: (tab) {
            context.read<TripsBloc>().add(ChangeTripsTabEvent(tab));
          },
        ),
        AllLoadsItem(selectedTab: widget.selectedTab, trips: widget.trips),
        SizedBox(height: AppConstants.h * 0.01),

        // NoLoadsFound(),
      ],
    );
  }
}
