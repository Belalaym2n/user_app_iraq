class AdModel {
  final int id;
  final String headline;
  final String description;
  final List<String> images;
  final String? actionUrl;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  AdModel({
    required this.id,
    required this.headline,
    required this.description,
    required this.images,
    this.actionUrl,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      headline: json['headline'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      actionUrl: json['action_url'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'headline': headline,
      'description': description,
      'images': images,
      'action_url': actionUrl,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}