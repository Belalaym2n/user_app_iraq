import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/loads/presentation/bloc/getTripsBloc/trips_status.dart';

import '../../../data/models/last_trip_model.dart';
import '../../../domain/use_cases/get_trip_use_case.dart';
import '../../../domain/use_cases/cancel_use_case.dart';

import 'trips_events.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final GetTripsUseCase getTripsUseCase;
  final CancelTripUseCase cancelTripUseCase;

  TripsBloc(
      this.getTripsUseCase,
      this.cancelTripUseCase,
      ) : super(TripsInitial()) {
    on<GetTripsEvent>(_onGetTrips);
    on<ChangeTripsTabEvent>(_onChangeTab);
    on<CancelTripEvent>(_onCancelTrip);
  }

  /// =============================
  /// GET TRIPS
  /// =============================
  Future<void> _onGetTrips(
      GetTripsEvent event,
      Emitter<TripsState> emit,
      ) async {
    emit(TripsLoading());
     final result = await getTripsUseCase();

    if (result.isSuccess) {
      emit(
        TripsLoaded(
          trips: result.data,
        ),
      );
    } else {
      emit(
        TripsError(result.error.toString()),
      );
    }
  }

  /// =============================
  /// CHANGE TAB
  /// =============================
  void _onChangeTab(
      ChangeTripsTabEvent event,
      Emitter<TripsState> emit,
      ) {
    final current = state;
    if (current is TripsLoaded) {
      emit(
        current.copyWith(
          selectedTab: event.tab,
          cancelSuccess: false,
          cancelError: null,
        ),
      );
    }
  }

  /// =============================
  /// CANCEL TRIP
  /// =============================
  Future<void> _onCancelTrip(
      CancelTripEvent event,
      Emitter<TripsState> emit,
      ) async {
    final current = state;
    if (current is! TripsLoaded) return;

    // 🔄 show loading
    emit(current.copyWith(
      isCancelling: true,
      cancelError: null,
    ));

    final result = await cancelTripUseCase(event.tripId);

    if (result.isSuccess) {
      final updatedTrips = current.trips.map((trip) {
        if (trip.id.toString() == event.tripId) {
          return trip.copyWith(
            status: TripStatus.cancelled,
            updatedAt: DateTime.now(),
          );
        }
        return trip;
      }).toList();

      emit(
        current.copyWith(
          trips: updatedTrips,
          isCancelling: false,
          cancelSuccess: true,
        ),
      );
    } else {
      emit(
        current.copyWith(
          isCancelling: false,
          cancelError: result.error.toString(),
        ),
      );
    }
  }

}
