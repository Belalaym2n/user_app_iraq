class RegisterModel {
  RegisterModel({this.success, this.message, this.data, this.requestId});

  RegisterModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    requestId = json['request_id'];
  }

  bool? success;
  String? message;
  Data? data;
  String? requestId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['request_id'] = requestId;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,

    this.emailVerifiedAt,
    this.twoFactorEnabled,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];

    emailVerifiedAt = json['email_verified_at'];
    twoFactorEnabled = json['two_factor_enabled'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? name;
  String? email;

  String? phone;
  dynamic emailVerifiedAt;
  bool? twoFactorEnabled;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;

    map['email_verified_at'] = emailVerifiedAt;
    map['two_factor_enabled'] = twoFactorEnabled;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
