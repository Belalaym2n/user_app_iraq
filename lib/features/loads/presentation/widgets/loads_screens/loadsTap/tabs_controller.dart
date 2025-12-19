import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loadsTap/tap_item.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

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
  });

  final TripsTab selectedTab;
  final List<TripModel> trips;
  final ValueChanged<TripsTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final labels = [
      LocaleKeys.MyLoadsScreen_posted.tr(),
      LocaleKeys.MyLoadsScreen_completed.tr(),
      LocaleKeys.MyLoadsScreen_inTransit.tr(),
      LocaleKeys.MyLoadsScreen_cancel.tr(),
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
                  orderCount: _countForTab(tab, trips),
                  isSelected: isSelected,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  int _countForTab(TripsTab tab, List<TripModel> trips) {
    switch (tab) {
      case TripsTab.pending:
        return trips.where((e) => e.status == TripStatus.pending).length;
      case TripsTab.completed:
        return trips.where((e) => e.status == TripStatus.completed).length;
      case TripsTab.inTransit:
        return trips.where((e) => e.status == TripStatus.started).length;
      case TripsTab.cancelled:
        return trips.where((e) => e.status == TripStatus.cancelled).length;
    }
  }
}
