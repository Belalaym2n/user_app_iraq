import '../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/rate_model.dart';
import '../repositories/rate_domain_repo.dart';

class SubmitRatingUseCase {
  final RatingDomainRepo repository;

  SubmitRatingUseCase(this.repository);

  Future<Result> call(SubmitRatingRequest request) {
    return repository.submitRating(request);
  }
  Result<bool> checkValidation(SubmitRatingRequest request) {
    return repository.validateRatingRequest(request);
  }
}