import 'package:equatable/equatable.dart';
import 'package:user_app_iraq/features/loads/presentation/bloc/getTripsBloc/trips_status.dart';

abstract class TripsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTripsEvent extends TripsEvent {}

class ChangeTripsTabEvent extends TripsEvent {
  final TripsTab tab;
  ChangeTripsTabEvent(this.tab);

  @override
  List<Object?> get props => [tab];
}

class CancelTripEvent extends TripsEvent {
  final String tripId;

  CancelTripEvent(this.tripId);

  @override
  List<Object?> get props => [tripId];
}
