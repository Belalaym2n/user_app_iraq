class UserProfileModel {
  final int id;
  final String name;
  final String email;
  final String type;
  final String phone;

  final String? photoUrl;
  final String? dateOfBirth;
  final String? gender;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;

  final DateTime? emailVerifiedAt;
  final bool twoFactorEnabled;

  final DateTime createdAt;
  final DateTime updatedAt;

  final TripStatisticsModel? tripStatistics;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.phone,
    this.photoUrl,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.emailVerifiedAt,
    required this.twoFactorEnabled,
    required this.createdAt,
    required this.updatedAt,
    this.tripStatistics,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      type: json['type'] ?? '',
      phone: json['phone'] ?? '',

      photoUrl: json['photo_url'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],

      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.tryParse(json['email_verified_at'])
          : null,

      twoFactorEnabled: json['two_factor_enabled'] ?? false,

      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ??
          DateTime.now(),

      tripStatistics: json['trip_statistics'] != null
          ? TripStatisticsModel.fromJson(json['trip_statistics'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "type": type,
      "phone": phone,
      "photo_url": photoUrl,
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "address": address,
      "city": city,
      "state": state,
      "postal_code": postalCode,
      "country": country,
      "email_verified_at": emailVerifiedAt?.toIso8601String(),
      "two_factor_enabled": twoFactorEnabled,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "trip_statistics": tripStatistics?.toJson(),
    };
  }
}
class TripStatisticsModel {
  final int totalTrips;
  final int pendingTrips;
  final int acceptedTrips;
  final int startedTrips;
  final int completedTrips;
  final int cancelledTrips;

  TripStatisticsModel({
    required this.totalTrips,
    required this.pendingTrips,
    required this.acceptedTrips,
    required this.startedTrips,
    required this.completedTrips,
    required this.cancelledTrips,
  });

  factory TripStatisticsModel.fromJson(Map<String, dynamic> json) {
    return TripStatisticsModel(
      totalTrips: json['total_trips'] ?? 0,
      pendingTrips: json['pending_trips'] ?? 0,
      acceptedTrips: json['accepted_trips'] ?? 0,
      startedTrips: json['started_trips'] ?? 0,
      completedTrips: json['completed_trips'] ?? 0,
      cancelledTrips: json['cancelled_trips'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "total_trips": totalTrips,
      "pending_trips": pendingTrips,
      "accepted_trips": acceptedTrips,
      "started_trips": startedTrips,
      "completed_trips": completedTrips,
      "cancelled_trips": cancelledTrips,
    };
  }
}
