 import '../../../profile/data/models/profile_model.dart';
 class TripModel {
   final int id;
   final TripStatus status;

   final String pickupAddress;
   final double pickupLat;
   final double pickupLng;

   final String destinationAddress;
   final double destinationLat;
   final double destinationLng;

   final String vehicleType;
   final double basePrice;

   final DateTime scheduledAt;
   final String description;
   final String? notes;

   final UserProfileModel user;

   final DateTime createdAt;
   final DateTime updatedAt;

   TripModel({
     required this.id,
     required this.status,
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
     required this.user,
     required this.createdAt,
     required this.updatedAt,
   });

   /// ✅ COPY WITH
   TripModel copyWith({
     int? id,
     TripStatus? status,
     String? pickupAddress,
     double? pickupLat,
     double? pickupLng,
     String? destinationAddress,
     double? destinationLat,
     double? destinationLng,
     String? vehicleType,
     double? basePrice,
     DateTime? scheduledAt,
     String? description,
     String? notes,
     UserProfileModel? user,
     DateTime? createdAt,
     DateTime? updatedAt,
   }) {
     return TripModel(
       id: id ?? this.id,
       status: status ?? this.status,
       pickupAddress: pickupAddress ?? this.pickupAddress,
       pickupLat: pickupLat ?? this.pickupLat,
       pickupLng: pickupLng ?? this.pickupLng,
       destinationAddress:
       destinationAddress ?? this.destinationAddress,
       destinationLat:
       destinationLat ?? this.destinationLat,
       destinationLng:
       destinationLng ?? this.destinationLng,
       vehicleType: vehicleType ?? this.vehicleType,
       basePrice: basePrice ?? this.basePrice,
       scheduledAt: scheduledAt ?? this.scheduledAt,
       description: description ?? this.description,
       notes: notes ?? this.notes,
       user: user ?? this.user,
       createdAt: createdAt ?? this.createdAt,
       updatedAt: updatedAt ?? this.updatedAt,
     );
   }

   factory TripModel.fromJson(Map<String, dynamic> json) {
     return TripModel(
       id: json['id'],
       status: tripStatusFromString(json['status']),
       pickupAddress: json['pickup_address'],
       pickupLat: double.parse(json['pickup_lat']),
       pickupLng: double.parse(json['pickup_lng']),
       destinationAddress: json['destination_address'],
       destinationLat: double.parse(json['destination_lat']),
       destinationLng: double.parse(json['destination_lng']),
       vehicleType: json['vehicle_type'],
       basePrice: double.parse(json['base_price']),
       scheduledAt: DateTime.parse(json['scheduled_at']),
       description: json['description'] ?? '',
       notes: json['notes'],
       user: UserProfileModel.fromJson(json['user']),
       createdAt: DateTime.parse(json['created_at']),
       updatedAt: DateTime.parse(json['updated_at']),
     );
   }
 }

 enum TripStatus {
   pending,
   accepted,
   started,
   completed,
   cancelled,
 }


 TripStatus tripStatusFromString(String status) {
   return TripStatus.values.firstWhere(
         (e) => e.name == status,
     orElse: () => TripStatus.pending,
   );
 }

 String tripStatusToString(TripStatus status) => status.name;
