import 'package:user_app_iraq/features/loads/data/models/driver_info.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/data/models/vehicle_info_model.dart';

import '../../../addLoad/data/models/vehicle_model.dart';

class OfferModel {
  final int id;
  final double offeredPrice;
  final String? notes;
  final OfferStatus status;

  final DriverModel driver;
  final VehicleMiniModel vehicle;

  final DateTime createdAt;
  final DateTime updatedAt;

  OfferModel({
    required this.id,
    required this.offeredPrice,
    required this.status,
    this.notes,
    required this.driver,
    required this.vehicle,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      offeredPrice: toDouble(json['offered_price']),
      notes: json['notes'],
      status: offerStatusFromString(json['status']),
      driver: DriverModel.fromJson(json['driver']),
      vehicle: VehicleMiniModel.fromJson(json['vehicle']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

enum OfferStatus {
  pending,
  accepted,
  rejected,
}

OfferStatus offerStatusFromString(String status) {
  return OfferStatus.values.firstWhere(
        (e) => e.name == status,
    orElse: () => OfferStatus.pending,
  );
}
