import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/trip_domina_repo.dart';

class AcceptTripUseCase {
  final TripsDomainRepo repo;

  AcceptTripUseCase(this.repo);

  Future<Result> call(int tripId,int offerID) async {
    return await repo.accept(tripId,offerID);
  }
}
