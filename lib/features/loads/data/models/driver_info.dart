import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';

class DriverModel {
  final int id;
  final DriverUserModel user;
  final double rating;
  final int totalRides;

  DriverModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.totalRides,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      user: DriverUserModel.fromJson(json['user']),
      rating: toDouble(json['rating']),
      totalRides: json['total_rides'] ?? 0,
    );
  }
}
class DriverUserModel {
  final int id;
  final String name;
  final String phone;
  final String? photoUrl;

  DriverUserModel({
    required this.id,
    required this.name,
    required this.phone,
    this.photoUrl,
  });

  factory DriverUserModel.fromJson(Map<String, dynamic> json) {
    return DriverUserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      photoUrl: json['photo_url'],
    );
  }
}
