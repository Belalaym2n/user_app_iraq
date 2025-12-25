import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/rate_model.dart';

abstract class RatingRemoteDS {
  Future<Result> submitRating(SubmitRatingRequest request);
  Result<bool> validateRequest(SubmitRatingRequest request);
}
