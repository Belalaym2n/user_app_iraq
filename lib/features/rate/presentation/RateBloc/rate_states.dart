import '../../data/models/rate_model.dart';

abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingWithData extends RatingState {
  final double rating;

  RatingWithData({this.rating = 0.0});

  RatingWithData copyWith({double? rating}) {
    return RatingWithData(
      rating: rating ?? this.rating,
    );
  }
}

class RatingLoading extends RatingState {}

class RatingSuccess extends RatingState {
  final RatingModel rating;
  RatingSuccess(this.rating);
}

class RatingError extends RatingState {
  final String message;
  RatingError(this.message);
}

class RatingErrorWithoutLoading extends RatingState {
  final String message;
  RatingErrorWithoutLoading(this.message);
}