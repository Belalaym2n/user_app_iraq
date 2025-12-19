import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/trip_domina_repo.dart';
 
class GetTripsUseCase {
  final TripsDomainRepo repo;

  GetTripsUseCase(this.repo);

  Future<Result> call() async {
    return await repo.getTrips();
  }
}
