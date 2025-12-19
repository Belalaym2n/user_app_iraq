import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/trip_domina_repo.dart';

class CancelTripUseCase {
  final TripsDomainRepo repo;

  CancelTripUseCase(this.repo);

  Future<Result> call(String id) async {
    return await repo.cancelTrip(id);
  }
}
