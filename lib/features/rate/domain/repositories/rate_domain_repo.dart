import '../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/rate_model.dart';

abstract class RatingDomainRepo {
  Result<bool> validateRatingRequest(SubmitRatingRequest request);

  Future<Result> submitRating(SubmitRatingRequest request);
}
