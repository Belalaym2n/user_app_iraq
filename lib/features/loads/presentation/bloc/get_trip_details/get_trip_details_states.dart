import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';

import '../../../data/models/last_trip_model.dart';

abstract class TripDetailsState {}

class TripDetailsLoading extends TripDetailsState {}

class TripDetailsLoaded extends TripDetailsState {
  final TripDetailsModel trip;

  TripDetailsLoaded(this.trip);
}

class TripDetailsError extends TripDetailsState {
  final String message;

  TripDetailsError(this.message);
}
