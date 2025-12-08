class AddLoadModel {
  final String id;
  final String loadTitle;
  final String description;
  final String materialType;
  final double weight;
  final String vehicleType;

  final String pickupLocation;
  final double pickupLat;
  final double pickupLng;

  final String deliveryLocation;
  final double deliveryLat;
  final double deliveryLng;

  final String pickupDate;
  final String deliveryDate;
  final String pickupTime;
  final String deliveryTime;

  final double budget;

  AddLoadModel({
    required this.id,
    required this.loadTitle,
    required this.description,
    required this.materialType,
    required this.weight,
    required this.vehicleType,
    required this.pickupLocation,
    required this.pickupLat,
    required this.pickupLng,
    required this.deliveryLocation,
    required this.deliveryLat,
    required this.deliveryLng,
    required this.pickupDate,
    required this.deliveryDate,
    required this.pickupTime,
    required this.deliveryTime,
    required this.budget,
  });

  // -----------------------------
  // FROM JSON
  // -----------------------------
  factory AddLoadModel.fromJson(Map<String, dynamic> json) {
    return AddLoadModel(
      id: json['id'] ?? "",
      loadTitle: json['loadTitle'] ?? "",
      description: json['description'] ?? "",
      materialType: json['materialType'] ?? "",
      weight: (json['weight'] ?? 0).toDouble(),
      vehicleType: json['vehicleType'] ?? "",

      pickupLocation: json['pickupLocation'] ?? "",
      pickupLat: (json['pickupLat'] ?? 0).toDouble(),
      pickupLng: (json['pickupLng'] ?? 0).toDouble(),

      deliveryLocation: json['deliveryLocation'] ?? "",
      deliveryLat: (json['deliveryLat'] ?? 0).toDouble(),
      deliveryLng: (json['deliveryLng'] ?? 0).toDouble(),

      pickupDate: json['pickupDate'] ?? "",
      deliveryDate: json['deliveryDate'] ?? "",
      pickupTime: json['pickupTime'] ?? "",
      deliveryTime: json['deliveryTime'] ?? "",
      budget: (json['budget'] ?? 0).toDouble(),
    );
  }

  // -----------------------------
  // TO JSON
  // -----------------------------
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "loadTitle": loadTitle,
      "description": description,
      "materialType": materialType,
      "weight": weight,
      "vehicleType": vehicleType,

      "pickupLocation": pickupLocation,
      "pickupLat": pickupLat,
      "pickupLng": pickupLng,

      "deliveryLocation": deliveryLocation,
      "deliveryLat": deliveryLat,
      "deliveryLng": deliveryLng,

      "pickupDate": pickupDate,
      "deliveryDate": deliveryDate,
      "pickupTime": pickupTime,
      "deliveryTime": deliveryTime,

      "budget": budget,
    };
  }
}
