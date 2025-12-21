import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/noLoads/no_loads_found.dart';

import '../../../../data/models/last_trip_model.dart';
import '../../../bloc/getTripsBloc/trips_bloc.dart';
import '../../../bloc/getTripsBloc/trips_events.dart';
import '../../../bloc/getTripsBloc/trips_status.dart';
import '../loadTypes/allLoadTypeScreen/cancel_load_item.dart';
import '../loadTypes/allLoadTypeScreen/completed_load.dart';
import '../loadTypes/allLoadTypeScreen/in_progress_load.dart';
import '../loadTypes/allLoadTypeScreen/posted_load.dart';

class AllLoadsItem extends StatelessWidget {
  const AllLoadsItem({
    super.key,
    required this.trips,
    required this.selectedTab,
  });

  final List<TripModel> trips;
  final TripsTab selectedTab;

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return NoLoadsFound();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: trips.length,
      itemBuilder: (_, i) {
        return itemForSelectedTab(selectedTab, trips[i], context);
      },
    );
  }

  Widget itemForSelectedTab(
    TripsTab tab,
    TripModel trip,
    BuildContext context,
  ) {
    switch (tab) {
      case TripsTab.pending:

        return PostedLoad(
          onConfirmCancel: () {
            context.read<TripsBloc>().add(CancelTripEvent(trip.id.toString()));
          },
          tripModel: trip,
        );

      case TripsTab.completed:
        print("Complete");
        return CompletedLoad(tripModel: trip);

      case TripsTab.cancelled:
        return CancelLoadItem(tripModel: trip);

      case TripsTab.inTransit:
        return InProgressLoad(
          tripModel: trip,
          onConfirmCancel: () {
            context.read<TripsBloc>().add(CancelTripEvent(trip.id.toString()));
          },
        );
      case TripsTab.accepted:
        // TODO: Handle this case.
        return PostedLoad(
          onConfirmCancel: () {
            context.read<TripsBloc>().add(CancelTripEvent(trip.id.toString()));
          },
          tripModel: trip,
        );
    }
  }
}
