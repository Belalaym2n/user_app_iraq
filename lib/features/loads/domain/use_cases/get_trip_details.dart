import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';

import '../../../addLoad/data/models/load_model.dart';
import '../repositories/trip_domina_repo.dart';

class GetTripDetailsUseCase {
  final TripsDomainRepo repository;

  GetTripDetailsUseCase(this.repository);

  Future<Result> call(String tripId) {
    return repository.getTripDetails(tripId);
  }
}
