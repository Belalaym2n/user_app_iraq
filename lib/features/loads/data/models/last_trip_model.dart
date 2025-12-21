import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';

import '../../../profile/data/models/profile_model.dart';
import '../../../profile/data/models/profile_model.dart';

import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import '../../../profile/data/models/profile_model.dart';

import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import '../../../profile/data/models/profile_model.dart';

class TripModel {
  final int id;
  final String tripTitle;
  final TripStatus status;

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

  final String description;
  final String? notes;
  final String? weight;
  final String? material;

  final UserProfileModel? user;
  final List<OfferModel> offers;

  final DateTime? acceptedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  TripModel({
    required this.id,
    required this.tripTitle,
    required this.status,
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
    required this.description,
    this.notes,
    this.weight,
    this.material,
    this.user,
    required this.offers,
    this.acceptedAt,
    this.startedAt,
    this.completedAt,
    this.cancelledAt,
    this.cancellationReason,
    this.createdAt,
    this.updatedAt,
  });
  TripModel copyWith({
    int? id,
    String? tripTitle,
    TripStatus? status,

    String? pickupAddress,
    double? pickupLat,
    double? pickupLng,
    DateTime? pickupDate,

    String? destinationAddress,
    double? destinationLat,
    double? destinationLng,
    DateTime? destinationDate,

    String? vehicleType,
    double? basePrice,
    DateTime? scheduledAt,

    String? description,
    String? notes,
    String? weight,
    String? material,

    UserProfileModel? user,
    List<OfferModel>? offers,

    DateTime? acceptedAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
    String? cancellationReason,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TripModel(
      id: id ?? this.id,
      tripTitle: tripTitle ?? this.tripTitle,
      status: status ?? this.status,

      pickupAddress: pickupAddress ?? this.pickupAddress,
      pickupLat: pickupLat ?? this.pickupLat,
      pickupLng: pickupLng ?? this.pickupLng,
      pickupDate: pickupDate ?? this.pickupDate,

      destinationAddress: destinationAddress ?? this.destinationAddress,
      destinationLat: destinationLat ?? this.destinationLat,
      destinationLng: destinationLng ?? this.destinationLng,
      destinationDate: destinationDate ?? this.destinationDate,

      vehicleType: vehicleType ?? this.vehicleType,
      basePrice: basePrice ?? this.basePrice,
      scheduledAt: scheduledAt ?? this.scheduledAt,

      description: description ?? this.description,
      notes: notes ?? this.notes,
      weight: weight ?? this.weight,
      material: material ?? this.material,

      user: user ?? this.user,
      offers: offers ?? this.offers,

      acceptedAt: acceptedAt ?? this.acceptedAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,

      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // =========================
  // FROM JSON (NULL SAFE)
  // =========================
  factory TripModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TripModel(
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

    return TripModel(
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

  // =========================
  // Helpers
  // =========================
  bool get hasOffers => offers.isNotEmpty;
  bool get isCancelled => status == TripStatus.cancelled;
}

// =========================
// SAFE PARSERS
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

// =========================
// STATUS
// =========================
enum TripStatus { pending, accepted, started, completed, cancelled }

TripStatus tripStatusFromString(dynamic status) {
  if (status == null) return TripStatus.pending;

  return TripStatus.values.firstWhere(
        (e) => e.name == status.toString(),
    orElse: () => TripStatus.pending,
  );
}

String tripStatusToString(TripStatus status) => status.name;





