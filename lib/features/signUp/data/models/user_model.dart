class UserModel {
  final String name;
  final String gmail;
  final String password;
  final String phone;
    int ? userID;
  final String confirmPassword;

  UserModel({
    required this.name,
    required this.phone,
    required this.confirmPassword,

    required this.gmail,
    required this.userID,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      userID: json['id'] ?? '',
      gmail: json['email'] ?? '',
      confirmPassword: json['password_confirmation'] ?? '',

      phone: json['phone'] ?? '',
      password: 'password'??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': gmail,
      "password": password,
      "password_confirmation": password,
      "phone": phone,
    };
  }
}
