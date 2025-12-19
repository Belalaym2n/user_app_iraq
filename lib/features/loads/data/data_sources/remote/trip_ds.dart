import '../../../../../core/handleErrors/result_pattern.dart';

abstract class TripsRemoteDS {
  Future<Result> getTrips();
  Future<Result> cancelTrip(String id );
  Future<Result> getTripDetails(String tripId);

}
