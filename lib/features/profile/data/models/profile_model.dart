class UserProfileModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? photoUrl;
  final String? dateOfBirth;

  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;

  final DateTime? emailVerifiedAt;
  final bool twoFactorEnabled;
  final String createdAt;
  final String updatedAt;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.photoUrl,
    this.dateOfBirth,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.emailVerifiedAt,
    required this.twoFactorEnabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photoUrl: json['photo_url'],
      dateOfBirth: json['date_of_birth'],

      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],

      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.tryParse(json['email_verified_at'])
          : null,
      twoFactorEnabled: json['two_factor_enabled'] ?? false,
      createdAt:json['created_at']??"",
      updatedAt:  json['updated_at']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "photo_url": photoUrl,
      "date_of_birth": dateOfBirth,

      "city": city,
      "state": state,
      "postal_code": postalCode,
      "country": country,

      "email_verified_at": emailVerifiedAt?.toIso8601String(),
      "two_factor_enabled": twoFactorEnabled,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString(),
    };
  }
}
