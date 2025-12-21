import 'package:equatable/equatable.dart';
import '../../../data/models/trip_details_model.dart';

sealed class TripDetailsState extends Equatable {
  const TripDetailsState();

  @override
  List<Object?> get props => [];
}

/// 🔹 INITIAL
class TripDetailsInitial extends TripDetailsState {
  const TripDetailsInitial();
}

/// 🔹 LOADING
class TripDetailsLoading extends TripDetailsState {
  const TripDetailsLoading();
}

/// 🔹 LOADED
class TripDetailsLoaded extends TripDetailsState {
  final TripDetailsModel trip;

  final bool isAccepting;
  final bool acceptSuccess;
  final String? acceptError;

  const TripDetailsLoaded({
    required this.trip,
    this.isAccepting = false,
    this.acceptSuccess = false,
    this.acceptError,
  });

  TripDetailsLoaded copyWith({
    TripDetailsModel? trip,
    bool? isAccepting,
    bool? acceptSuccess,
    String? acceptError,
  }) {
    return TripDetailsLoaded(
      trip: trip ?? this.trip,
      isAccepting: isAccepting ?? this.isAccepting,
      acceptSuccess: acceptSuccess ?? false, // reset
      acceptError: acceptError,
    );
  }

  @override
  List<Object?> get props =>
      [trip, isAccepting, acceptSuccess, acceptError];
}

/// 🔹 ERROR
class TripDetailsError extends TripDetailsState {
  final String message;

  const TripDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
