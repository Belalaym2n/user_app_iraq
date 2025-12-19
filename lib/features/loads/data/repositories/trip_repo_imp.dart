 import '../../../../core/handleErrors/result_pattern.dart';
import '../../domain/repositories/trip_domina_repo.dart';
import '../data_sources/remote/trip_ds.dart';

class TripsDataRepo implements TripsDomainRepo {
  final TripsRemoteDS remoteDS;

  TripsDataRepo(this.remoteDS);

  @override
  Future<Result> getTrips() {
    return remoteDS.getTrips();
  }
  @override
  Future<Result> cancelTrip(String id) {
    return remoteDS.cancelTrip(id);
  }

  @override
  Future<Result> getTripDetails(String tripId) {
    // TODO: implement getTripDetails
    return remoteDS.getTripDetails(tripId);
  }
}
