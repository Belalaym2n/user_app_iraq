class TripModel {
  final int? id;
  final String? status;

  final String pickupAddress;
  final double pickupLat;
  final double pickupLng;

  final String destinationAddress;
  final double destinationLat;
  final double destinationLng;

  final String vehicleType;
  final double basePrice;

  final DateTime? scheduledAt;

  final String? description;
  final String? notes;


  final List<dynamic>? offers;
  final DateTime? acceptedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;

  final String? cancellationReason;

  final DateTime ?createdAt;
  final DateTime? updatedAt;

  TripModel({
      this.id,
      this.status,
    required this.pickupAddress,
    required this.pickupLat,
    required this.pickupLng,
    required this.destinationAddress,
    required this.destinationLat,
    required this.destinationLng,
    required this.vehicleType,
    required this.basePrice,
    required this.scheduledAt,
    required this.description,
      this.notes,
       this.offers,
      this.acceptedAt,
      this.startedAt,
      this.completedAt,
      this.cancelledAt,
      this.cancellationReason,
      this.createdAt,
      this.updatedAt,
  });

  // -----------------------------
  // FROM JSON
  // -----------------------------
  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      status: json['status'],

      pickupAddress: json['pickup_address'] ?? "",
      pickupLat: double.parse(json['pickup_lat'].toString()),
      pickupLng: double.parse(json['pickup_lng'].toString()),

      destinationAddress: json['destination_address'] ?? "",
      destinationLat: double.parse(json['destination_lat'].toString()),
      destinationLng: double.parse(json['destination_lng'].toString()),

      vehicleType: json['vehicle_type'] ?? "",
      basePrice: double.parse(json['base_price'].toString()),

      scheduledAt: json['scheduled_at'] != null
          ? DateTime.parse(json['scheduled_at'])
          : null,

      description: json['description'],
      notes: json['notes'],


      offers: json['offers'] ?? [],

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

      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      "notes": notes,
    };
  }
}
