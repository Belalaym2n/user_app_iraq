import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../addLoad/data/models/load_model.dart';

class DriverInfo {
  final String driverId;
  final String name;
  final String phoneNumber;
  final String licenseNumber;
   final String? photoUrl;
  final double rating;
  final int totalTrips;
  final int experienceYears;
  final List<String> certifications;
  final bool isVerified;
  final String? emergencyContact;
  final DateTime? lastActiveAt;

  DriverInfo({
    required this.driverId,
    required this.name,
    required this.phoneNumber,
    required this.licenseNumber,
     this.photoUrl,
    this.rating = 0.0,
    this.totalTrips = 0,
    this.experienceYears = 0,
    this.certifications = const [],
    this.isVerified = false,
    this.emergencyContact,
    this.lastActiveAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'driverId': driverId,
      'name': name,
      'phoneNumber': phoneNumber,
      'licenseNumber': licenseNumber,
       'photoUrl': photoUrl,
      'rating': rating,
      'totalTrips': totalTrips,
      'experienceYears': experienceYears,
      'certifications': certifications,
      'isVerified': isVerified,
      'emergencyContact': emergencyContact,
      'lastActiveAt':
      lastActiveAt != null ? Timestamp.fromDate(lastActiveAt!) : null,
    };
  }

  factory DriverInfo.fromMap(Map<String, dynamic> map) {
    return DriverInfo(
      driverId: map['driverId'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      licenseNumber: map['licenseNumber'] ?? '',
       photoUrl: map['photoUrl'],
      rating: (map['rating'] ?? 0.0).toDouble(),
      totalTrips: map['totalTrips'] ?? 0,
      experienceYears: map['experienceYears'] ?? 0,
      certifications: List<String>.from(map['certifications'] ?? []),
      isVerified: map['isVerified'] ?? false,
      emergencyContact: map['emergencyContact'],
     );
  }

  DriverInfo copyWith({
    String? driverId,
    String? name,
    String? phoneNumber,
    String? licenseNumber,
    DateTime? licenseExpiry,
    String? photoUrl,
    double? rating,
    int? totalTrips,
    int? experienceYears,
    List<String>? certifications,
    bool? isVerified,
    String? emergencyContact,
    DateTime? lastActiveAt,
  }) {
    return DriverInfo(
      driverId: driverId ?? this.driverId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      licenseNumber: licenseNumber ?? this.licenseNumber,
       photoUrl: photoUrl ?? this.photoUrl,
      rating: rating ?? this.rating,
      totalTrips: totalTrips ?? this.totalTrips,
      experienceYears: experienceYears ?? this.experienceYears,
      certifications: certifications ?? this.certifications,
      isVerified: isVerified ?? this.isVerified,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }
}