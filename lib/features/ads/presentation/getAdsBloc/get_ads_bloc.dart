import 'package:bloc/bloc.dart';

import '../../domain/getAdsUseCases/get_ads_use_case.dart';
import 'get_ads_events.dart';
import 'get_ads_states.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final GetAdsUseCase getAdsUseCase;

  AdsBloc(this.getAdsUseCase) : super(AdsInitial()) {
    on<GetAdsEvent>(_onGetAds);
    on<CarouselPageChanged>(_onPageChanged);
    on<CarouselNextPage>(_onNextPage);
  }

  Future<void> _onGetAds(
      GetAdsEvent event,
      Emitter<AdsState> emit,
      ) async {
    emit(AdsLoading());

    final result = await getAdsUseCase();

    if (result.isSuccess) {
      emit(AdsLoaded(ads: result.data));
    } else {
      emit(AdsError(result.error.toString()));
    }
  }

  void _onPageChanged(
      CarouselPageChanged event,
      Emitter<AdsState> emit,
      ) {
    if (state is AdsLoaded) {
      final current = state as AdsLoaded;
      emit(current.copyWith(currentIndex: event.index));
    }
  }

  void _onNextPage(
      CarouselNextPage event,
      Emitter<AdsState> emit,
      ) {
    if (state is AdsLoaded) {
      final current = state as AdsLoaded;
      final next =
          (current.currentIndex + 1) % event.length;
      emit(current.copyWith(currentIndex: next));
    }
  }
}
