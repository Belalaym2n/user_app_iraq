
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../addLoad/presentation/widgets/basicInformation/build_vehicle.dart';
import 'load_states.dart';

class LoadModel {
  String? assignedDriverId;
  final String id;
  final String userId; // Owner of the load
  final String title;
  final String pickupLocation;
  final String deliveryLocation;
   final double weight;
  final VehicleType vehicleType;
  final double budget;
  final DateTime pickupDate;
  final DateTime? deliveryDate;
  final LoadStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int bidsCount;
  final String? description;
  final List<String> requirements;
  final String? contactPerson;
  final String? contactPhone;
  final bool isUrgent;
  final double? distance;
  final Map<String, double>? pickupCoordinates; // {lat: 0.0, lng: 0.0}
  final Map<String, double>? deliveryCoordinates;
  final double? minBudget;
  final double? maxBudget;
  final String? dimensions;

  final String? specialInstructions;
  final List<String> images; // URLs to load images
  final bool isActive;

  // NEW: Added missing fields for UI compatibility
  final int viewCount;

  LoadModel({
    this.assignedDriverId,
    required this.id,
    required this.userId,
    required this.title,
    required this.pickupLocation,
    required this.deliveryLocation,
     required this.weight,
    required this.vehicleType,
    required this.budget,
    required this.pickupDate,
    this.deliveryDate,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.bidsCount = 0,
    this.description,
    this.requirements = const [],
    this.contactPerson,
    this.contactPhone,
    this.isUrgent = false,
    this.distance,
    this.pickupCoordinates,
    this.deliveryCoordinates,
    this.minBudget,
    this.maxBudget,
    this.specialInstructions,
    this.images = const [],
    this.isActive = true,
    this.dimensions,
    this.viewCount = 0, // NEW
  });

  Map<String, dynamic> toMap() {
    return {
      'assignedDriverId': assignedDriverId,
      'id': id,
      'userId': userId,
      'title': title,
      'pickupLocation': pickupLocation,
      'deliveryLocation': deliveryLocation,
       'weight': weight,
      'dimensions': dimensions,
      'vehicleType': _enumName(vehicleType),
      'budget': budget,
      'pickupDate': Timestamp.fromDate(pickupDate),
      'deliveryDate':
      deliveryDate != null ? Timestamp.fromDate(deliveryDate!) : null,
      'status': _enumName(status),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'bidsCount': bidsCount,
      'description': description,
      'requirements': requirements,
      'contactPerson': contactPerson,
      'contactPhone': contactPhone,
      'isUrgent': isUrgent,
      'distance': distance,
      'pickupCoordinates': pickupCoordinates,
      'deliveryCoordinates': deliveryCoordinates,
      'minBudget': minBudget,
      'maxBudget': maxBudget,
      'specialInstructions': specialInstructions,
      'images': images,
      'isActive': isActive,
      'viewCount': viewCount, // NEW
    };
  }

  factory LoadModel.fromMap(Map<String, dynamic> map) {
    return LoadModel(
      assignedDriverId: map['assignedDriverId'],
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      pickupLocation: map['pickupLocation'] ?? '',
      deliveryLocation: map['deliveryLocation'] ?? '',
       weight: (map['weight'] ?? 0).toDouble(),
      dimensions: map['dimensions'] ?? '',
      vehicleType: _parseVehicleType(map['vehicleType']),
      budget: (map['budget'] ?? 0).toDouble(),
      // ROBUST parsing for all timestamp formats
      pickupDate: _parseDateTime(map['pickupDate']),
      deliveryDate: _parseNullableDateTime(map['deliveryDate']),
      status: _parseLoadStatus(map['status']),
      createdAt: _parseDateTime(map['createdAt']),
      updatedAt: _parseNullableDateTime(map['updatedAt']),
      bidsCount: map['bidsCount'] ?? 0,
      description: map['description'],
      requirements: List<String>.from(map['requirements'] ?? []),
      contactPerson: map['contactPerson'],
      contactPhone: map['contactPhone'],
      isUrgent: map['isUrgent'] ?? false,
      distance: map['distance']?.toDouble(),
      pickupCoordinates: map['pickupCoordinates'] != null
          ? Map<String, double>.from(map['pickupCoordinates'])
          : null,
      deliveryCoordinates: map['deliveryCoordinates'] != null
          ? Map<String, double>.from(map['deliveryCoordinates'])
          : null,
      minBudget: map['minBudget']?.toDouble(),
      maxBudget: map['maxBudget']?.toDouble(),
      specialInstructions: map['specialInstructions'],
      images: List<String>.from(map['images'] ?? []),
      isActive: map['isActive'] ?? true,
      viewCount: map['viewCount'] ?? 0,
    );
  }

  // --- Enum parsing helpers (robust to either 'enumName' or 'Enum.enumName') ---
  static String _enumName(Object e) => e.toString().split('.').last;

  static LoadStatus _parseLoadStatus(dynamic raw) {
    if (raw == null) return LoadStatus.posted;
    final value = raw.toString();
    final key = value.contains('.') ? value.split('.').last : value;
    final lower = key.toLowerCase();
    for (final s in LoadStatus.values) {
      if (_enumName(s).toLowerCase() == lower) return s;
    }
    return LoadStatus.posted;
  }



  static VehicleType _parseVehicleType(dynamic raw) {
    if (raw == null) return VehicleType.truck;
    final value = raw.toString();
    final key = value.contains('.') ? value.split('.').last : value;
    final lower = key.toLowerCase();
    for (final v in VehicleType.values) {
      if (_enumName(v).toLowerCase() == lower) return v;
    }
    return VehicleType.truck;
  }

  LoadModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? pickupLocation,
    String? deliveryLocation,
     double? weight,
    String? dimensions,
    VehicleType? vehicleType,
    double? budget,
    DateTime? pickupDate,
    DateTime? deliveryDate,
    LoadStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? bidsCount,
    String? description,
    List<String>? requirements,
    String? contactPerson,
    String? contactPhone,
    bool? isUrgent,
    double? distance,
    Map<String, double>? pickupCoordinates,
    Map<String, double>? deliveryCoordinates,
    double? minBudget,
    double? maxBudget,
    String? specialInstructions,
    List<String>? images,
    bool? isActive,
    int? viewCount, // NEW
  }) {
    return LoadModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
       weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      vehicleType: vehicleType ?? this.vehicleType,
      budget: budget ?? this.budget,
      pickupDate: pickupDate ?? this.pickupDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bidsCount: bidsCount ?? this.bidsCount,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      contactPerson: contactPerson ?? this.contactPerson,
      contactPhone: contactPhone ?? this.contactPhone,
      isUrgent: isUrgent ?? this.isUrgent,
      distance: distance ?? this.distance,
      pickupCoordinates: pickupCoordinates ?? this.pickupCoordinates,
      deliveryCoordinates: deliveryCoordinates ?? this.deliveryCoordinates,
      minBudget: minBudget ?? this.minBudget,
      maxBudget: maxBudget ?? this.maxBudget,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      images: images ?? this.images,
      isActive: isActive ?? this.isActive,
      viewCount: viewCount ?? this.viewCount, // NEW
    );
  }

// Helper methods for robust timestamp parsing
  static DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();

    if (value is Timestamp) {
      return value.toDate();
    }

    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        print('Error parsing date string: $value');
        return DateTime.now();
      }
    }

    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }

    if (value is DateTime) {
      return value;
    }

    return DateTime.now();
  }

  static DateTime? _parseNullableDateTime(dynamic value) {
    if (value == null) return null;
    return _parseDateTime(value);
  }
}

final fakeLoad = LoadModel(
  id: "LOAD123",
  userId: "USER789",
  title: "Steel Beams Transport",
  pickupLocation: "Baghdad, Al-Mansour",
  deliveryLocation: "Basra, Industrial Area",
  weight: 12.5,
  // Tons
  dimensions: "6m x 1.5m x 1.2m",
  vehicleType: VehicleType.truck,
  budget: 350000,
  // IQD
  pickupDate: DateTime.now().add(const Duration(days: 1)),
  deliveryDate: DateTime.now().add(const Duration(days: 2)),
  status: LoadStatus.posted,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  bidsCount: 5,
  description: "Heavy steel beams requiring forklift at loading/unloading.",
  requirements: [
    "Forklift Required",
    "Experienced Driver",
    "Straps for securing load",
  ],
  contactPerson: "Ali Mohammed",
  contactPhone: "+9647700000000",
  isUrgent: true,
  distance: 545.0,
  // km
  pickupCoordinates: {"lat": 33.3128, "lng": 44.3615},
  deliveryCoordinates: {"lat": 30.5080, "lng": 47.7835},
  minBudget: 300000,
  maxBudget: 400000,
  specialInstructions: "Handle carefully, no sharp turns.",
  images: [
    "https://dummyimage.com/600x400/cccccc/000000.jpg",
    "https://dummyimage.com/500x300/bbbbbb/000000.jpg",
  ],
  isActive: true,
  viewCount: 143,
  assignedDriverId: null,
);