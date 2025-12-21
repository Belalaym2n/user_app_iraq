abstract class TripDetailsEvent {}

class LoadTripDetailsEvent extends TripDetailsEvent {
  final String tripId;

  LoadTripDetailsEvent({
    required this.tripId,
  });
}

class AcceptTripEvent extends TripDetailsEvent {
  final int tripId;
  final int offerID;
   AcceptTripEvent({
    required this.tripId,
    required this.offerID,
  });
}
