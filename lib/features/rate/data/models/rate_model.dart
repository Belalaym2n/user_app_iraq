class RatingModel {
  final int id;
  final int userId;
  final int tripId;
  final double rating;
  final String description;
  final DateTime createdAt;

  RatingModel({
    required this.id,
    required this.userId,
    required this.tripId,
    required this.rating,
    required this.description,
    required this.createdAt,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'],
      userId: json['user_id'],
      tripId: json['trip_id'],
      rating: double.parse(json['rating'].toString()),
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'trip_id': tripId,
      'rating': rating,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class SubmitRatingRequest {
  final int tripId;
  final double rating;
  final String description;

  SubmitRatingRequest({
    required this.tripId,
    required this.rating,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'trip_id': tripId,
      'rating': rating,
      'description': description,
    };
  }
}