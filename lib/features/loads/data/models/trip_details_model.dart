
import '../../../addLoad/data/models/vehicle_model.dart';
import '../../../profile/data/models/profile_model.dart';
import 'driver_info.dart';
import 'last_trip_model.dart';
import 'offers_model.dart';

class TripDetailsModel extends TripModel {
  final DateTime? acceptedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;
  final List<OfferModel> offers;
  final DriverInfo? acceptedDriver;
  final VehicleModel? acceptedVehicle;

  TripDetailsModel({
    required super.id,
    required super.status,
    required super.pickupAddress,
    required super.pickupLat,
    required super.pickupLng,
    required super.destinationAddress,
    required super.destinationLat,
    required super.destinationLng,
    required super.vehicleType,
    required super.basePrice,
    required super.scheduledAt,
    required super.description,
    super.notes,
    required super.user,
    required super.createdAt,
    required super.updatedAt,

    this.acceptedAt,
    this.startedAt,
    this.completedAt,
    this.cancelledAt,
    this.cancellationReason,
    this.offers = const [],
    this.acceptedDriver,
    this.acceptedVehicle,
  });

  factory TripDetailsModel.fromJson(Map<String, dynamic> json) {
    return TripDetailsModel(
      id: json['id'],
      status: tripStatusFromString(json['status']),

      pickupAddress: json['pickup_address'],
      pickupLat: _toDouble(json['pickup_lat']),
      pickupLng: _toDouble(json['pickup_lng']),

      destinationAddress: json['destination_address'],
      destinationLat: _toDouble(json['destination_lat']),
      destinationLng: _toDouble(json['destination_lng']),

      vehicleType: json['vehicle_type'],
      basePrice: _toDouble(json['base_price']),

      scheduledAt: DateTime.parse(json['scheduled_at']),
      description: json['description'] ?? '',
      notes: json['notes'],

      user: UserProfileModel.fromJson(json['user']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),

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

      offers: (json['offers'] as List?)
          ?.map((e) => OfferModel.fromJson(e))
          .toList() ??
          [],

      acceptedDriver: json['accepted_driver'] != null &&
          (json['accepted_driver'] as Map).isNotEmpty
          ? DriverInfo.fromMap(json['accepted_driver'])
          : null,

      acceptedVehicle: json['accepted_vehicle'] != null &&
          (json['accepted_vehicle'] as Map).isNotEmpty
          ? VehicleModel.fromJson(json['accepted_vehicle'])
          : null,
    );
  }
}
double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  return double.parse(value.toString());
}
