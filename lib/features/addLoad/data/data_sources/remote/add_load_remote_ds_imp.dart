import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart'
    show LocationPermission, Geolocator, LocationAccuracy;
import 'package:user_app_iraq/core/apiManager/api_manager.dart';
import 'package:user_app_iraq/core/apiManager/end_points.dart';
import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../models/load_model.dart';
import '../../models/location_search_result.dart';
import '../../models/vehicle_model.dart';
import 'add_post_remote_ds.dart';

class AddLoadRemoteDSIMP implements AddLoadRemoteDS {
  static final Dio _dio = Dio();
  final List<VehicleModel> fakeVehicles = [
    VehicleModel(
      id: 1,
      driverId: 101,
      make: "Toyota",
      model: "Hiace",
      year: 2022,
      color: "White",
      licensePlate: "VAN-1234",
      vin: "JTDBR32E720123456",
      vehicleType: "van",
      fuelType: "diesel",
      transmission: "manual",
      doors: 4,
      seats: 3,
      isPrimary: true,
      status: "active",
      verificationStatus: "verified",
      verificationDate: DateTime(2025, 1, 10),
      verifiedBy: 1,
      verificationNotes: "All documents verified",
      registrationNumber: "REG-VAN-001",
      registrationExpiry: "2026-01-01",
      registrationState: "Baghdad",
      insuranceProvider: "Iraq Insurance Co",
      insurancePolicyNumber: "INS-VAN-98765",
      insuranceExpiry: "2026-01-01",
      inspectionDate: "2025-01-05",
      inspectionExpiry: "2026-01-05",
      inspectionCertificate: "CERT-VAN-001",
      mileage: 45000,
      conditionRating: 4.5,
      lastMaintenanceDate: "2025-02-01",
      nextMaintenanceDue: "2025-08-01",
      photos: [
        "https://example.com/vehicles/van_front.jpg",
        "https://example.com/vehicles/van_side.jpg",
      ],
      features: [
        "Air Conditioning",
        "GPS",
        "Rear Camera",
      ],
      notes: "Suitable for medium cargo deliveries",
      createdBy: 1,
      updatedBy: 1,
      createdAt: DateTime(2024, 12, 1),
      updatedAt: DateTime(2025, 2, 15),
    ),
    VehicleModel(
      id: 2,
      driverId: 102,
      make: "Volvo",
      model: "FH16",
      year: 2021,
      color: "Blue",
      licensePlate: "TRK-5678",
      vin: "YV2RT40A9LB123456",
      vehicleType: "truck",
      fuelType: "diesel",
      transmission: "automatic",
      doors: 2,
      seats: 2,
      isPrimary: true,
      status: "active",
      verificationStatus: "verified",
      verificationDate: DateTime(2025, 1, 12),
      verifiedBy: 1,
      verificationNotes: "Truck fully inspected and approved",
      registrationNumber: "REG-TRUCK-010",
      registrationExpiry: "2026-03-01",
      registrationState: "Basra",
      insuranceProvider: "Middle East Insurance",
      insurancePolicyNumber: "INS-TRK-445566",
      insuranceExpiry: "2026-03-01",
      inspectionDate: "2025-01-08",
      inspectionExpiry: "2026-01-08",
      inspectionCertificate: "CERT-TRK-010",
      mileage: 120000,
      conditionRating: 4.2,
      lastMaintenanceDate: "2025-01-20",
      nextMaintenanceDue: "2025-07-20",
      photos: [
        "https://example.com/vehicles/truck_front.jpg",
        "https://example.com/vehicles/truck_side.jpg",
      ],
      features: [
        "ABS",
        "GPS",
        "Heavy Load Support",
      ],
      notes: "Suitable for heavy and long-distance transport",
      createdBy: 1,
      updatedBy: 1,
      createdAt: DateTime(2024, 11, 15),
      updatedAt: DateTime(2025, 2, 18),
    ),

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
      return Result.success(pos);
    } catch (e) {
      return Result.failure("Failed to get location: $e");
    }
  }

  @override
  Future<Result> permissionCheck() async {
    LocationPermission permission = await Geolocator.checkPermission();

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



  @override
  Future<Result> getVehicles() async {
  await Future.delayed(Duration(seconds: 1));

    return Result.success(fakeVehicles);
  }

  @override
  Future<Result> addLoad(TripModel load) async {
    final response = await ApiService.request(
      endpoint: AppEndPoints.addTrip,
      method: "POST",
      queryParameters: {"locale": "en"},
      data: load.toJson(),
    );

    if (response is Result) return response;

    return Result.success(response);
  }

  String? validateLoad(TripModel load) {
    if (load.vehicleType.isEmpty) {
      return LocaleKeys.Add_Load_vehicle_type_required.tr();
    }
    if (load.pickupAddress.isEmpty) {
      return LocaleKeys
          .Add_Load_pickup_location_required.tr(); //"Pickup location must not be empty.";
    }
    if (load.destinationAddress.isEmpty) {
      return LocaleKeys
          .Add_Load_delivery_location_required.tr(); //"Pickup location must not be empty.";
    }
    if (load.pickupDate.toString().isEmpty || load.destinationDate == null){
      return LocaleKeys
          .Add_Load_pickup_date_required.tr(); // "Delivery location must not be empty.";
    }
     if (load.destinationDate.toString().isEmpty
        || load.destinationDate == null) {
      return LocaleKeys.Add_Load_deliveryDate.tr();
      "Pickup date is required.";
    }
    return null; // VALID!
  }
}
