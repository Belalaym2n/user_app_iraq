import '../../../../core/utils/app_colors.dart';

abstract class AdsState {}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsLoaded extends AdsState {
  final List<AdModel> ads;
  final int currentIndex;

  AdsLoaded({
    required this.ads,
    this.currentIndex = 0,
  });

  AdsLoaded copyWith({
    List<AdModel>? ads,
    int? currentIndex,
  }) {
    return AdsLoaded(
      ads: ads ?? this.ads,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class AdsError extends AdsState {
  final String message;
  AdsError(this.message);
}
