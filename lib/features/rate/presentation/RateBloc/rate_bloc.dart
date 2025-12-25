
import 'package:bloc/bloc.dart';
import '../../domain/use_cases/send_rate_use_case.dart';
import 'rate_events.dart';
import 'rate_states.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final SubmitRatingUseCase submitRatingUseCase;

  RatingBloc(this.submitRatingUseCase) : super(RatingInitial()) {
    on<UpdateRatingEvent>(_onUpdateRating);
    on<SubmitRatingEvent>(_onSubmitRating);
  }

  void _onUpdateRating(
      UpdateRatingEvent event,
      Emitter<RatingState> emit,
      ) {
    final currentState = state;

    if (currentState is RatingWithData) {
      emit(currentState.copyWith(rating: event.rating));
    } else {
      emit(RatingWithData(rating: event.rating));
    }
  }

  Future<void> _onSubmitRating(
      SubmitRatingEvent event,
      Emitter<RatingState> emit,
      ) async {
    final validationResult = submitRatingUseCase.checkValidation(event.request);

    if (!validationResult.isSuccess) {
      emit(RatingErrorWithoutLoading(validationResult.error.toString()));
      return;
    }
    emit(RatingLoading());

    final result = await submitRatingUseCase(event.request);

    if (result.isSuccess) {
      emit(RatingSuccess(result.data));
    } else {
      emit(RatingError(result.error.toString()));
    }
  }
}