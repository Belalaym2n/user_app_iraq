import 'package:user_app_iraq/features/addLoad/data/models/vehicle_model.dart';

import '../../../loads/data/models/driver_info.dart';
import '../../../loads/data/models/offers_model.dart';
import '../../../signUp/data/models/user_model.dart';

class TripModel {
  final int? id;
  final String? tripTitle;
  final String? status;

  final String pickupAddress;
  final double pickupLat;
  final double pickupLng;
  final DateTime? pickupDate;

  final String destinationAddress;
  final double destinationLat;
  final double destinationLng;
  final DateTime? destinationDate;

  final String vehicleType;
  final double basePrice;

  final DateTime? scheduledAt;

  final String? description;
  final String? notes;
  final String? weight;
  final String? material;

  final UserModel? user;
  final DriverModel? acceptedDriver;
  final VehicleModel? acceptedVehicle;

  final List<OfferModel> offers;

  final DateTime? acceptedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  TripModel({
    this.id,
    this.tripTitle,
    this.status,
    required this.pickupAddress,
    required this.pickupLat,
    required this.pickupLng,
    this.pickupDate,
    required this.destinationAddress,
    required this.destinationLat,
    required this.destinationLng,
    this.destinationDate,
    required this.vehicleType,
    required this.basePrice,
    this.scheduledAt,
    this.description,
    this.notes,
    this.weight,
    this.material,
    this.user,
    this.acceptedDriver,
    this.acceptedVehicle,
    required this.offers,
    this.acceptedAt,
    this.startedAt,
    this.completedAt,
    this.cancelledAt,
    this.cancellationReason,
    this.createdAt,
    this.updatedAt,
  });

  // =========================
  // FROM JSON
  // =========================
  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      tripTitle: json['trip_title'],
      status: json['status'],

      pickupAddress: json['pickup_address'] ?? '',
      pickupLat: double.tryParse(json['pickup_lat'].toString()) ?? 0,
      pickupLng: double.tryParse(json['pickup_lng'].toString()) ?? 0,
      pickupDate: json['pickup_date'] != null
          ? DateTime.parse(json['pickup_date'])
          : null,

      destinationAddress: json['destination_address'] ?? '',
      destinationLat:
      double.tryParse(json['destination_lat'].toString()) ?? 0,
      destinationLng:
      double.tryParse(json['destination_lng'].toString()) ?? 0,
      destinationDate: json['destination_date'] != null
          ? DateTime.parse(json['destination_date'])
          : null,

      vehicleType: json['vehicle_type'] ?? '',
      basePrice: double.tryParse(json['base_price'].toString()) ?? 0,

      scheduledAt: json['scheduled_at'] != null
          ? DateTime.parse(json['scheduled_at'])
          : null,

      description: json['description'],
      notes: json['notes'],
      weight: json['weight'],
      material: json['material'],

      user:
      json['user'] != null ? UserModel.fromJson(json['user']) : null,

      acceptedDriver: json['accepted_driver'] != null &&
          json['accepted_driver'].isNotEmpty
          ? DriverModel.fromJson(json['accepted_driver'])
          : null,

      acceptedVehicle: json['accepted_vehicle'] != null &&
          json['accepted_vehicle'].isNotEmpty
          ? VehicleModel.fromJson(json['accepted_vehicle'])
          : null,

      offers: (json['offers'] as List<dynamic>? ?? [])
          .map((e) => OfferModel.fromJson(e))
          .toList(),

      acceptedAt: json['accepted_at'] != null
          ? DateTime.parse(json['accepted_at'])
          : null,
      startedAt: json['started_at'] != null
          ? DateTime.parse(json['started_at'])
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
      cancelledAt: json['cancelled_at'] != null
          ? DateTime.parse(json['cancelled_at'])
          : null,

      cancellationReason: json['cancellation_reason'],

      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  // =========================
  // TO JSON (Create / Update)
  // =========================
  Map<String, dynamic> toJson() {
    return {
      "trip_title": tripTitle,
      "pickup_address": pickupAddress,
      "pickup_lat": pickupLat,
      "pickup_lng": pickupLng,
      "destination_address": destinationAddress,
      "destination_lat": destinationLat,
      "destination_lng": destinationLng,
      "vehicle_type": vehicleType,
      "base_price": basePrice,
      "scheduled_at": scheduledAt?.toIso8601String(),
      "description": description,
      "pickup_date": pickupDate?.toIso8601String(),
      "destination_date": destinationDate?.toIso8601String(),

      "notes": notes,
      "weight": weight,
      "material": material,
    };
  }
}
