class VehicleModel {
  final int id;
  final int driverId;
  final String make;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final String vin;
  final String vehicleType;
  final String fuelType;
  final String transmission;
  final int doors;
  final int seats;
  final bool isPrimary;
  final String status;
  final String verificationStatus;
  final DateTime? verificationDate;
  final int? verifiedBy;
  final String? verificationNotes;
  final String? registrationNumber;
  final String? registrationExpiry;
  final String? registrationState;
  final String? insuranceProvider;
  final String? insurancePolicyNumber;
  final String? insuranceExpiry;
  final String? inspectionDate;
  final String? inspectionExpiry;
  final String? inspectionCertificate;
  final int? mileage;
  final double? conditionRating;
  final String? lastMaintenanceDate;
  final String? nextMaintenanceDue;
  final List<String> photos;
  final List<String> features;
  final String? notes;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehicleModel({
    required this.id,
    required this.driverId,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    required this.vin,
    required this.vehicleType,
    required this.fuelType,
    required this.transmission,
    required this.doors,
    required this.seats,
    required this.isPrimary,
    required this.status,
    required this.verificationStatus,
    this.verificationDate,
    this.verifiedBy,
    this.verificationNotes,
    this.registrationNumber,
    this.registrationExpiry,
    this.registrationState,
    this.insuranceProvider,
    this.insurancePolicyNumber,
    this.insuranceExpiry,
    this.inspectionDate,
    this.inspectionExpiry,
    this.inspectionCertificate,
    this.mileage,
    this.conditionRating,
    this.lastMaintenanceDate,
    this.nextMaintenanceDue,
    required this.photos,
    required this.features,
    this.notes,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] ?? 0,
      driverId: json['driver_id'] ?? 0,
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? 0,
      color: json['color'] ?? '',
      licensePlate: json['license_plate'] ?? '',
      vin: json['vin'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
      fuelType: json['fuel_type'] ?? '',
      transmission: json['transmission'] ?? '',
      doors: json['doors'] ?? 0,
      seats: json['seats'] ?? 0,
      isPrimary: json['is_primary'] ?? false,
      status: json['status'] ?? '',
      verificationStatus: json['verification_status'] ?? '',
      verificationDate: json['verification_date'] != null
          ? DateTime.parse(json['verification_date'])
          : null,
      verifiedBy: json['verified_by'],
      verificationNotes: json['verification_notes'],
      registrationNumber: json['registration_number'],
      registrationExpiry: json['registration_expiry'],
      registrationState: json['registration_state'],
      insuranceProvider: json['insurance_provider'],
      insurancePolicyNumber: json['insurance_policy_number'],
      insuranceExpiry: json['insurance_expiry'],
      inspectionDate: json['inspection_date'],
      inspectionExpiry: json['inspection_expiry'],
      inspectionCertificate: json['inspection_certificate'],
      mileage: json['mileage'],
      conditionRating: _parseDouble(json['condition_rating']),

      lastMaintenanceDate: json['last_maintenance_date'],
      nextMaintenanceDue: json['next_maintenance_due'],
      photos: json['photos'] != null
          ? List<String>.from(json['photos'])
          : [],
      features: json['features'] != null
          ? List<String>.from(json['features'])
          : [],
      notes: json['notes'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driver_id': driverId,
      'make': make,
      'model': model,
      'year': year,
      'color': color,
      'license_plate': licensePlate,
      'vin': vin,
      'vehicle_type': vehicleType,
      'fuel_type': fuelType,
      'transmission': transmission,
      'doors': doors,
      'seats': seats,
      'is_primary': isPrimary,
      'status': status,
      'verification_status': verificationStatus,
      'verification_date': verificationDate?.toIso8601String(),
      'verified_by': verifiedBy,
      'verification_notes': verificationNotes,
      'registration_number': registrationNumber,
      'registration_expiry': registrationExpiry,
      'registration_state': registrationState,
      'insurance_provider': insuranceProvider,
      'insurance_policy_number': insurancePolicyNumber,
      'insurance_expiry': insuranceExpiry,
      'inspection_date': inspectionDate,
      'inspection_expiry': inspectionExpiry,
      'inspection_certificate': inspectionCertificate,
      'mileage': mileage,
      'condition_rating': conditionRating,
      'last_maintenance_date': lastMaintenanceDate,
      'next_maintenance_due': nextMaintenanceDue,
      'photos': photos,
      'features': features,
      'notes': notes,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;

    if (value is double) return value;

    if (value is int) return value.toDouble();

    if (value is String) {
      return double.tryParse(value);
    }

    return null;
  }

}
