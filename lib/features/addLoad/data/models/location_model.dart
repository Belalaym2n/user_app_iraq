class LoadLocationModel {
  final double lat;
  final double lng;
  final String address;

  LoadLocationModel({
    required this.lat,
    required this.lng,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
    "address": address,
  };
}
