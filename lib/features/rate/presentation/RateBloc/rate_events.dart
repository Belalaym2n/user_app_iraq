import '../../data/models/rate_model.dart';

abstract class RatingEvent {}

class UpdateRatingEvent extends RatingEvent {
  final double rating;
  UpdateRatingEvent(this.rating);
}



class SubmitRatingEvent extends RatingEvent {
  final SubmitRatingRequest request;
  SubmitRatingEvent(this.request);
}