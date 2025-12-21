import 'package:bloc/bloc.dart';
import 'package:user_app_iraq/features/loads/domain/use_cases/accept_trip_use_case.dart';

import '../../../domain/use_cases/get_trip_details.dart';
 import 'get_trip_details_event.dart';
import 'get_trip_details_states.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_details_model.dart';
import '../../../domain/use_cases/get_trip_details.dart';
import '../../../domain/use_cases/accept_trip_use_case.dart';

class TripDetailsBloc
    extends Bloc<TripDetailsEvent, TripDetailsState> {
  final GetTripDetailsUseCase getTripDetailsUseCase;
  final AcceptTripUseCase acceptTripUseCase;

  TripDetailsBloc(
      this.getTripDetailsUseCase,
      this.acceptTripUseCase,
      ) : super(const TripDetailsInitial()) {
    on<LoadTripDetailsEvent>(_onLoadTripDetails);
    on<AcceptTripEvent>(_onAcceptTrip);
  }

  /// =============================
  /// LOAD TRIP DETAILS
  /// =============================
  Future<void> _onLoadTripDetails(
      LoadTripDetailsEvent event,
      Emitter<TripDetailsState> emit,
      ) async {
    emit(const TripDetailsLoading());

    final result = await getTripDetailsUseCase(event.tripId);

    if (result.isSuccess) {
      emit(
        TripDetailsLoaded(
          trip: result.data,
        ),
      );
    } else {
      emit(
        TripDetailsError(
          result.error.toString(),
        ),
      );
    }
  }

  /// =============================
  /// ACCEPT TRIP
  /// =============================
  Future<void> _onAcceptTrip(
      AcceptTripEvent event,
      Emitter<TripDetailsState> emit,
      ) async {
    final current = state;
    if (current is! TripDetailsLoaded) return;

    // 🔄 show loading
    emit(
      current.copyWith(
        isAccepting: true,
        acceptError: null,
      ),
    );

    final result = await acceptTripUseCase(event.tripId,event.offerID);

    if (result.isSuccess) {
      emit(
        current.copyWith(
          trip: result.data,
          isAccepting: false,
          acceptSuccess: true,
        ),
      );
    } else {
      emit(
        current.copyWith(
          isAccepting: false,
          acceptError: result.error.toString(),
        ),
      );
    }
  }
}
