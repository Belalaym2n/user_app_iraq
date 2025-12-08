import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';
import '../repositories/add_load_domain.dart';

class LocationUseCase {
  final AddLoadRepo repo;

  LocationUseCase(this.repo);

  Future<Result> getCurrentLocation() async {
    return await repo.getCurrentLocation();
  }
  Future<Result> reverseGeocode(double lat, double lng) async {
    return await repo.reverseGeocode(lat,lng);
  }
  Future<Result> searchPlaces(String query) => repo.searchPlaces(query);
  Future<Result> getLatLngFromPlaceId(String placeId) =>
      repo.getLatLngFromPlaceId(placeId);

}
