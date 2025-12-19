
import '../../../data/models/last_trip_model.dart';

abstract class TripDetailsEvent {}

class LoadTripDetailsEvent extends TripDetailsEvent {
  final String tripId;

  LoadTripDetailsEvent({
    required this.tripId,
   });
}
