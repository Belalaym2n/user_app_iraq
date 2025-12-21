import '../../../../../core/handleErrors/result_pattern.dart';

abstract class TripsRemoteDS {
  Future<Result> getTrips();
  Future<Result> cancelTrip(String id );
  Future<Result> acceptTrip(int tripId,int offerId );
  Future<Result> getTripDetails(String tripId);

}
