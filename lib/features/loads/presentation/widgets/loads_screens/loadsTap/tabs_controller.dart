import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loadsTap/tap_item.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../profile/data/models/profile_model.dart';
import '../../../../data/models/last_trip_model.dart';
import '../../../bloc/getTripsBloc/trips_bloc.dart';
import '../../../bloc/getTripsBloc/trips_events.dart';
import '../../../bloc/getTripsBloc/trips_status.dart';

class TabControllerItem extends StatelessWidget {
  const TabControllerItem({
    super.key,
    required this.selectedTab,
    required this.trips,
    required this.onTabChanged,
    required this.tripStatisticsModel,
  });

  final TripsTab selectedTab;
  final List<TripModel> trips;
  final TripStatisticsModel tripStatisticsModel;
  final ValueChanged<TripsTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final labels = [
      LocaleKeys.MyLoadsScreen_posted.tr(),
      LocaleKeys.MyLoadsScreen_accepted.tr(),

      LocaleKeys.MyLoadsScreen_completed.tr(),
      LocaleKeys.MyLoadsScreen_biddingStarted.tr(),

      LocaleKeys.MyLoadsScreen_cancel.tr(),
    ];
    final tripTabCounts = [
      tripStatisticsModel.pendingTrips,
      tripStatisticsModel.acceptedTrips,
      tripStatisticsModel.completedTrips,
      tripStatisticsModel.startedTrips,

      tripStatisticsModel.cancelledTrips,
    ];

    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(labels.length, (index) {
            final tab = TripsTab.values[index];
            final isSelected = selectedTab == tab;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onTabChanged(tab),
                child: OrderStatusWidget(
                  statusName: labels[index],
                  orderCount: tripTabCounts[index],
                  isSelected: isSelected,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
