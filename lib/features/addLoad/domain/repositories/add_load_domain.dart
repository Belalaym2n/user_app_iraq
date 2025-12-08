import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';
import 'package:user_app_iraq/features/addLoad/data/models/load_model.dart';

abstract class AddLoadRepo {
  Future<Result> getCurrentLocation();
  Future<Result> reverseGeocode(double lat, double lng);
  Future<Result> getVehicles();
  Future<Result> getLatLngFromPlaceId(String placeId);
  Future<Result> addLoad(AddLoadModel load);

  Future<Result> searchPlaces(String query);

}
