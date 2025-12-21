class VehicleMiniModel {
  final int id;
  final String make;
  final String model;
  final int year;
  final String vehicleType;
  final String color;

  VehicleMiniModel({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.vehicleType,
    required this.color,
  });

  factory VehicleMiniModel.fromJson(Map<String, dynamic> json) {
    return VehicleMiniModel(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      vehicleType: json['vehicle_type'],
      color: json['color'],
    );
  }
}
