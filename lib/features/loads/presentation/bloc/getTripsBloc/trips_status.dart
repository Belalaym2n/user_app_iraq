import 'package:equatable/equatable.dart';
import '../../../../addLoad/data/models/load_model.dart' hide TripModel;
import '../../../../profile/data/models/profile_model.dart';
import '../../../data/models/last_trip_model.dart';

 enum TripsTab {
  pending,
  accepted,
  completed,
  inTransit,
  cancelled,
}
sealed class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object?> get props => [];
}

class TripsInitial extends TripsState {}

class TripsLoading extends TripsState {}

class TripsLoaded extends TripsState {
  final List<TripModel> trips;
  final TripsTab selectedTab;
  final TripStatisticsModel tripStatistics;

  final bool isCancelling;
  final bool cancelSuccess;
  final String? cancelError;

  const TripsLoaded({
    required this.trips,
    required  this.tripStatistics,
    this.selectedTab = TripsTab.pending,
    this.isCancelling = false,
    this.cancelSuccess = false,
    this.cancelError,
  });

  TripsLoaded copyWith({
    List<TripModel>? trips,
    TripStatisticsModel? tripsStatic,
    TripsTab? selectedTab,
    bool? isCancelling,
    bool? cancelSuccess,
    String? cancelError,
  }) {
    return TripsLoaded(
      tripStatistics: tripsStatic??this.tripStatistics,
      trips: trips ?? this.trips,
      selectedTab: selectedTab ?? this.selectedTab,
      isCancelling: isCancelling ?? this.isCancelling,
      cancelSuccess: cancelSuccess ?? false, // reset تلقائي
      cancelError: cancelError,
    );
  }

  List<TripModel> get filteredTrips {
    switch (selectedTab) {
      case TripsTab.pending:
        return trips.where((e) => e.status == TripStatus.pending).toList();
      case TripsTab.completed:
        return trips.where((e) => e.status == TripStatus.completed).toList();
      case TripsTab.inTransit:
        return trips.where((e) => e.status == TripStatus.started).toList();
      case TripsTab.cancelled:
        return trips.where((e) => e.status == TripStatus.cancelled).toList();
      case TripsTab.accepted:
        return trips.where((e) => e.status == TripStatus.accepted).toList();
    }
  }

  @override
  List<Object?> get props =>
      [trips, selectedTab, isCancelling, cancelSuccess, cancelError];
}

class TripsError extends TripsState {
  final String message;
  const TripsError(this.message);

  @override
  List<Object?> get props => [message];
}
