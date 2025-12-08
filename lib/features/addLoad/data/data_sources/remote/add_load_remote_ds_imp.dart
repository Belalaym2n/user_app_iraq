import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart'
    show LocationPermission, Geolocator, LocationAccuracy;
import 'package:user_app_iraq/core/apiManager/api_manager.dart';
import 'package:user_app_iraq/core/apiManager/end_points.dart';
import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';

import '../../models/load_model.dart';
import '../../models/location_search_result.dart';
import '../../models/vehicle_model.dart';
import 'add_post_remote_ds.dart';

class AddLoadRemoteDSIMP implements AddLoadRemoteDS {
  static final Dio _dio = Dio();
  final List<VehicleModel> fakeVehicles = [
    VehicleModel(id: "1", name: "Toyota Hilux"),
    VehicleModel(id: "2", name: "Nissan Patrol"),
    VehicleModel(id: "3", name: "Mitsubishi L200"),
    VehicleModel(id: "4", name: "Ford Ranger"),
  ];

  // TODO: implement getCurrentLocation
  @override
  Future<Result> getCurrentLocation() async {
    final result = await permissionCheck();
    if (result.isFailure) {
      return Result.failure(result.error);
    }
    await gbsCheck();
    try {
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print("Pos $pos");
      return Result.success(pos);
    } catch (e) {
      return Result.failure("Failed to get location: $e");
    }
  }

  @override
  Future<Result> permissionCheck() async {
    LocationPermission permission = await Geolocator.checkPermission();

    print("permision is ${permission}");
    // لو مفيش إذن → نطلبه
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Result.failure("denied"); // ← user عمل Don't Allow
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Result.failure("deniedForever");
    }
    return Result.success("Location choose success");
  }

  @override
  Future<Result> reverseGeocode(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      final p = placemarks.first;

      final address =
          "${p.street}, ${p.subAdministrativeArea}, ${p.administrativeArea}, ${p.country}";

      return Result.success(address);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<bool> gbsCheck() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();

    print("gps is $enabled");

    if (!enabled) {
      await Geolocator.openLocationSettings();
      return false;
    }

    return true;
  }

  @override
  Future<Result> getLatLngFromPlaceId(String placeId) async {
    try {
      final res = await _dio.get(
        "https://maps.googleapis.com/maps/api/place/details/json",
        queryParameters: {
          "place_id": placeId,
          "key": AppEndPoints.google_api_key,
        },
      );

      final location = res.data["result"]["geometry"]["location"];

      return Result.success({"lat": location["lat"], "lng": location["lng"]});
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> searchPlaces(String query) async {
    try {
      if (query.isEmpty) return Result.success([]);

      final res = await _dio.get(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json",
        queryParameters: {
          "input": query,
          "key": AppEndPoints.google_api_key,
          "types": "geocode",
        },
      );

      if (res.data["status"] == "OK") {
        return Result.success(res.data["predictions"]);
      }

      return Result.failure("Failed fetching predictions");
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  static String _generateSessionToken() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Future<Result> getVehicles() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return Result.success(fakeVehicles);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> addLoad(AddLoadModel load) async {
    if (load.vehicleType.isEmpty) {
      return Result.failure("Vehicle type is required.");
    }

    if (load.pickupLocation.isEmpty) {
      return Result.failure("Pickup location must not be empty.");
    }

    if (load.deliveryLocation.isEmpty) {
      return Result.failure("Delivery location must not be empty.");
    }

    if (load.pickupDate.isEmpty) {
      return Result.failure("Pickup date is required.");
    }

    if (load.deliveryDate.isEmpty) {
      return Result.failure("Delivery date is required.");
    }

    if (load.pickupTime.isEmpty) {
      return Result.failure("Pickup time is required.");
    }

    if (load.deliveryTime.isEmpty) {
      return Result.failure("Delivery time is required.");
    }

    try {
      await Future.delayed(Duration(seconds: 2));
      return Result.success("Load added successfully.");
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
