// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../../addLoad/data/models/offers_model.dart';
// import 'bids_status_model.dart';
// import 'driver_info.dart';
//
// class BidModel {
//   final String id;
//   final String loadId;
//   final String driverId;
//   final String driverName;
//   final String? transporterPhotoUrl;
//   final double driverRating;
//   final int completedTrips;
//   final double bidAmount;
//   final String currency;
//   final DateTime estimatedPickup;
//   final DateTime estimatedDelivery;
//   final String? notes;
//   final String? additionalServices;
//   final BidStatus status;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final DateTime? expiresAt;
//   final String? rejectionReason;
//   final double? negotiatedAmount;
//   final int bidRank; // 1 = lowest bid, 2 = second lowest, etc.
//
//   // Enhanced driver and vehicle information
//   final DriverInfo? driverInfo;
//   // final VehicleInfo? vehicleInfo;
//
//   // Business details
//   final String? companyName;
//   final String? gstNumber;
//   final bool hasInsurance;
//   final double? insuranceCoverage;
//   final bool hasGpsTracking;
//   final List<String> certifications;
//   final String? previousWorkExamples;
//
//   // Pricing breakdown
//   final double? baseAmount;
//   final double? fuelSurcharge;
//   final double? tollCharges;
//   final double? loadingCharges;
//   final double? unloadingCharges;
//   final double? otherCharges;
//
//   BidModel({
//     required this.id,
//     required this.loadId,
//     required this.driverId,
//     required this.driverName,
//     this.transporterPhotoUrl,
//     required this.driverRating,
//     required this.completedTrips,
//     required this.bidAmount,
//     this.currency = 'IQD',
//     required this.estimatedPickup,
//     required this.estimatedDelivery,
//     this.notes,
//     this.additionalServices,
//     this.status = BidStatus.pending,
//     required this.createdAt,
//     required this.updatedAt,
//     this.expiresAt,
//     this.rejectionReason,
//     this.negotiatedAmount,
//     this.bidRank = 0,
//     this.driverInfo,
//     // this.vehicleInfo,
//     this.companyName,
//     this.gstNumber,
//     this.hasInsurance = false,
//     this.insuranceCoverage,
//     this.hasGpsTracking = false,
//     this.certifications = const [],
//     this.previousWorkExamples,
//     this.baseAmount,
//     this.fuelSurcharge,
//     this.tollCharges,
//     this.loadingCharges,
//     this.unloadingCharges,
//     this.otherCharges,
//   });
//   String getTimeAgo() {
//     final now = DateTime.now();
//     final difference = now.difference(createdAt);
//
//     if (difference.inDays > 0) {
//       return '${difference.inDays}d ago';
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours}h ago';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes}m ago';
//     } else {
//       return 'Just now';
//     }
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'loadId': loadId,
//       'transporterId': driverId,
//       'driverName': driverName,
//       'transporterPhotoUrl': transporterPhotoUrl,
//       'driverRating': driverRating,
//       'completedTrips': completedTrips,
//       'bidAmount': bidAmount,
//       'currency': currency,
//       'estimatedPickup': Timestamp.fromDate(estimatedPickup),
//       'estimatedDelivery': Timestamp.fromDate(estimatedDelivery),
//       'notes': notes,
//       'additionalServices': additionalServices,
//       'status': status.name,
//       'createdAt': Timestamp.fromDate(createdAt),
//       'updatedAt': Timestamp.fromDate(updatedAt),
//       'expiresAt': expiresAt != null ? Timestamp.fromDate(expiresAt!) : null,
//       'rejectionReason': rejectionReason,
//       'negotiatedAmount': negotiatedAmount,
//       'bidRank': bidRank,
//       'driverInfo': driverInfo?.toMap(),
//       // 'vehicleInfo': vehicleInfo?.toMap(),
//       'companyName': companyName,
//       'gstNumber': gstNumber,
//       'hasInsurance': hasInsurance,
//       'insuranceCoverage': insuranceCoverage,
//       'hasGpsTracking': hasGpsTracking,
//       'certifications': certifications,
//       'previousWorkExamples': previousWorkExamples,
//       'baseAmount': baseAmount,
//       'fuelSurcharge': fuelSurcharge,
//       'tollCharges': tollCharges,
//       'loadingCharges': loadingCharges,
//       'unloadingCharges': unloadingCharges,
//       'otherCharges': otherCharges,
//     };
//   }
//
//   // FIXED BidModel.fromMap with robust timestamp parsing
//   factory BidModel.fromMap(Map<String, dynamic> map) {
//     return BidModel(
//       estimatedDelivery: DateTime.now(),
//       estimatedPickup: DateTime.now() ,
//       id: map['id'] ?? '',
//       loadId: map['loadId'] ?? '',
//       driverId: map['driverId'] ?? '',
//       driverName: map['driverName'] ?? '',
//       transporterPhotoUrl: map['transporterPhotoUrl'],
//       driverRating: (map['driverRating'] ?? 0.0).toDouble(),
//       completedTrips: map['completedTrips'] ?? 0,
//       bidAmount: (map['bidAmount'] ?? 0.0).toDouble(),
//       currency: map['currency'] ?? 'IQD',
//       // estimatedPickup: LoadModel._parseDateTime(map['estimatedPickup']),
//       // estimatedDelivery: LoadModel._parseDateTime(map['estimatedDelivery']),
//       notes: map['notes'],
//       additionalServices: map['additionalServices'],
//       status: BidStatus.values.firstWhere(
//             (e) => e.name == map['status'],
//         orElse: () => BidStatus.pending,
//       ),
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//       expiresAt: DateTime.now(),
//       rejectionReason: map['rejectionReason'],
//       negotiatedAmount: map['negotiatedAmount']?.toDouble(),
//       bidRank: map['bidRank'] ?? 0,
//       driverInfo: map['driverInfo'] != null
//           ? DriverInfo.fromMap(map['driverInfo'])
//           : null,
//       // vehicleInfo: map['vehicleInfo'] != null
//       //     ? VehicleInfo.fromMap(map['vehicleInfo'])
//       //     : null,
//       companyName: map['companyName'],
//       gstNumber: map['gstNumber'],
//       hasInsurance: map['hasInsurance'] ?? false,
//       insuranceCoverage: map['insuranceCoverage']?.toDouble(),
//       hasGpsTracking: map['hasGpsTracking'] ?? false,
//       certifications: List<String>.from(map['certifications'] ?? []),
//       previousWorkExamples: map['previousWorkExamples'],
//       baseAmount: map['baseAmount']?.toDouble(),
//       fuelSurcharge: map['fuelSurcharge']?.toDouble(),
//       tollCharges: map['tollCharges']?.toDouble(),
//       loadingCharges: map['loadingCharges']?.toDouble(),
//       unloadingCharges: map['unloadingCharges']?.toDouble(),
//       otherCharges: map['otherCharges']?.toDouble(),
//     );
//   }}