import '../../../../core/handleErrors/result_pattern.dart';

abstract class TripsDomainRepo {
  Future<Result> getTrips();
  Future<Result> cancelTrip(String id);
  Future<Result> accept(int tripId,int offerId);
  Future<Result> getTripDetails(String tripId);

}
