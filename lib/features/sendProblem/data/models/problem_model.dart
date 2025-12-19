
class ProblemModel {
  final int? id;
    String category;
  final String description;


  ProblemModel({
    this.id,
    required this.category,
    required this.description,

  });

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      id: json['id'],
      category: json['category'] ?? '',
      description: json['description'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'category': category,
      'description': description,
      };
  }

  ProblemModel copyWith({
    int? id,
    String? category,
    String? description,
    String? attachmentUrl,
    String? status,
    DateTime? createdAt,
    DateTime? resolvedAt,
  }) {
    return ProblemModel(
      id: id ?? this.id,
      category: category ?? this.category,
      description: description ?? this.description,

    );
  }
}