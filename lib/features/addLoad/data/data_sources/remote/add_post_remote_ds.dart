import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';

import '../../models/load_model.dart';

abstract class AddLoadRemoteDS {
  Future<Result> getCurrentLocation();

  Future<Result> permissionCheck();

  Future<bool> gbsCheck();

  Future<Result> getVehicles();

  Future<Result> reverseGeocode(double lat, double lng);

  Future<Result> searchPlaces(String query);
  Future<Result> addLoad(AddLoadModel load);

  Future<Result> getLatLngFromPlaceId(String placeId);
}
