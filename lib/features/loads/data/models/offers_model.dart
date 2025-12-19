import 'package:user_app_iraq/features/loads/data/models/driver_info.dart';

import '../../../addLoad/data/models/vehicle_model.dart';

class OfferModel {
  final int id;
  final double offeredPrice;
  final String? notes;
  final OfferStatus status;

  final DriverInfo? driver;
  final VehicleModel? vehicle;

  final DateTime? acceptedAt;
  final DateTime? rejectedAt;

  final DateTime createdAt;
  final DateTime updatedAt;

  OfferModel({
    required this.id,
    required this.offeredPrice,
    required this.status,
    this.notes,
    this.driver,
    this.vehicle,
    this.acceptedAt,
    this.rejectedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      offeredPrice: (json['offered_price'] as num).toDouble(),
      notes: json['notes'],
      status: offerStatusFromString(json['status']),
      driver: json['driver'] != null
          ? DriverInfo.fromMap(json['driver'])
          : null,
      vehicle: json['vehicle'] != null
          ? VehicleModel.fromJson(json['vehicle'])
          : null,
      acceptedAt: json['accepted_at'] != null
          ? DateTime.parse(json['accepted_at'])
          : null,
      rejectedAt: json['rejected_at'] != null
          ? DateTime.parse(json['rejected_at'])
          : null,
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
