import '../../../addLoad/data/models/vehicle_model.dart';
import '../../../profile/data/models/profile_model.dart';
import 'driver_info.dart';
import 'last_trip_model.dart';
import 'offers_model.dart';

import '../../../addLoad/data/models/vehicle_model.dart';
import '../../../profile/data/models/profile_model.dart';
import 'last_trip_model.dart';
import 'offers_model.dart';

class TripDetailsModel extends TripModel {
  TripDetailsModel({
    required int id,
    required String tripTitle,
    required TripStatus status,

    required String pickupAddress,
    required double pickupLat,
    required double pickupLng,
    DateTime? pickupDate,

    required String destinationAddress,
    required double destinationLat,
    required double destinationLng,
    DateTime? destinationDate,

    required String vehicleType,
    required double basePrice,
    DateTime? scheduledAt,

    required String description,
    String? notes,
    String? weight,
    String? material,

    UserProfileModel? user,
    required List<OfferModel> offers,

    DateTime? acceptedAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
    String? cancellationReason,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    tripTitle: tripTitle,
    status: status,

    pickupAddress: pickupAddress,
    pickupLat: pickupLat,
    pickupLng: pickupLng,
    pickupDate: pickupDate,

    destinationAddress: destinationAddress,
    destinationLat: destinationLat,
    destinationLng: destinationLng,
    destinationDate: destinationDate,

    vehicleType: vehicleType,
    basePrice: basePrice,
    scheduledAt: scheduledAt,

    description: description,
    notes: notes,
    weight: weight,
    material: material,

    user: user,
    offers: offers,

    acceptedAt: acceptedAt,
    startedAt: startedAt,
    completedAt: completedAt,
    cancelledAt: cancelledAt,
    cancellationReason: cancellationReason,

    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  // =========================
  // FROM JSON (NULL SAFE)
  // =========================
  factory TripDetailsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TripDetailsModel(
        id: 0,
        tripTitle: '',
        status: TripStatus.pending,
        pickupAddress: '',
        pickupLat: 0,
        pickupLng: 0,
        destinationAddress: '',
        destinationLat: 0,
        destinationLng: 0,
        vehicleType: '',
        basePrice: 0,
        description: '',
        offers: const [],
      );
    }

    return TripDetailsModel(
      id: json['id'] is int ? json['id'] : 0,
      tripTitle: json['trip_title'] ?? '',
      status: tripStatusFromString(json['status']),

      pickupAddress: json['pickup_address'] ?? '',
      pickupLat: _parseDouble(json['pickup_lat']),
      pickupLng: _parseDouble(json['pickup_lng']),
      pickupDate: _parseDate(json['pickup_date']),

      destinationAddress: json['destination_address'] ?? '',
      destinationLat: _parseDouble(json['destination_lat']),
      destinationLng: _parseDouble(json['destination_lng']),
      destinationDate: _parseDate(json['destination_date']),

      vehicleType: json['vehicle_type'] ?? '',
      basePrice: _parseDouble(json['base_price']),
      scheduledAt: _parseDate(json['scheduled_at']),

      description: json['description'] ?? '',
      notes: json['notes'],
      weight: json['weight'],
      material: json['material'],

      user: json['user'] is Map<String, dynamic>
          ? UserProfileModel.fromJson(json['user'])
          : null,

      offers: (json['offers'] is List)
          ? (json['offers'] as List)
          .map((e) => OfferModel.fromJson(e))
          .toList()
          : [],

      acceptedAt: _parseDate(json['accepted_at']),
      startedAt: _parseDate(json['started_at']),
      completedAt: _parseDate(json['completed_at']),
      cancelledAt: _parseDate(json['cancelled_at']),
      cancellationReason: json['cancellation_reason'],

      createdAt: _parseDate(json['created_at']),
      updatedAt: _parseDate(json['updated_at']),
    );
  }
}

// =========================
// SAFE HELPERS
// =========================
double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

DateTime? _parseDate(dynamic value) {
  if (value == null) return null;
  return DateTime.tryParse(value.toString());
}





double toDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  return double.parse(value.toString());
}
