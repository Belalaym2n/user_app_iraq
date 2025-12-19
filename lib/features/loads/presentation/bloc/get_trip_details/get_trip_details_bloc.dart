import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/get_trip_details.dart';
 import 'get_trip_details_event.dart';
import 'get_trip_details_states.dart';

class TripDetailsBloc
    extends Bloc<TripDetailsEvent, TripDetailsState> {

  final GetTripDetailsUseCase getTripDetailsUseCase;

  TripDetailsBloc(this.getTripDetailsUseCase)
      : super(TripDetailsLoading()) {
    on<LoadTripDetailsEvent>(_onLoadTripDetails);
  }

  Future<void> _onLoadTripDetails(
      LoadTripDetailsEvent event,
      Emitter<TripDetailsState> emit,
      ) async {


      emit(TripDetailsLoading());

    final result = await getTripDetailsUseCase(event.tripId);

    if (result.isSuccess) {
      emit(TripDetailsLoaded(result.data));
    } else {
      emit(TripDetailsError(result.error.toString()));
    }
  }
}
