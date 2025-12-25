// features/rating/data/repositories/rating_data_repo.dart
import '../../../../core/handleErrors/result_pattern.dart';
import '../../domain/repositories/rate_domain_repo.dart';
import '../data_sources/remote/rade_data_source.dart';
import '../models/rate_model.dart';

class RatingDataRepo implements RatingDomainRepo {
  final RatingRemoteDS remoteDS;

  RatingDataRepo(this.remoteDS);
  @override
  Result<bool> validateRatingRequest(SubmitRatingRequest request) {
    return remoteDS.validateRequest(request);
  }
  @override
  Future<Result> submitRating(SubmitRatingRequest request) {
    return remoteDS.submitRating(request);
  }
}