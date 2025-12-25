
enum ComplaintType {
  technical,
  service,
  driver,
  payment,
  safety,
  other,
}

enum ComplaintPriority {
  low,
  medium,
  high,
  urgent,
}

String complaintTypeToString(ComplaintType type) {
  switch (type) {
    case ComplaintType.technical:
      return 'Technical Issue';
    case ComplaintType.service:
      return 'Service Quality';
    case ComplaintType.driver:
      return 'Driver Behavior';
    case ComplaintType.payment:
      return 'Payment Issue';
    case ComplaintType.safety:
      return 'Safety Concern';
    case ComplaintType.other:
      return 'Other';
  }
}

String complaintPriorityToString(ComplaintPriority priority) {
  switch (priority) {
    case ComplaintPriority.low:
      return 'Low';
    case ComplaintPriority.medium:
      return 'Medium';
    case ComplaintPriority.high:
      return 'High';
    case ComplaintPriority.urgent:
      return 'Urgent';
  }
}

class ComplaintModel {
  final int id;
  final int userId;
  final ComplaintType type;
   final String details;
  final ComplaintPriority priority;
  final bool isAnonymous;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ComplaintModel({
    required this.id,
    required this.userId,
    required this.type,
     required this.details,
    required this.priority,
    required this.isAnonymous,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      id: json['id'],
      userId: json['user_id'],
      type: ComplaintType.values.firstWhere(
            (e) => e.name == json['type'],
        orElse: () => ComplaintType.other,
      ),
       details: json['details'] ?? '',
      priority: ComplaintPriority.values.firstWhere(
            (e) => e.name == json['priority'],
        orElse: () => ComplaintPriority.medium,
      ),
      isAnonymous: json['is_anonymous'] ?? false,
      status: json['status'] ?? 'pending',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type.name,
       'details': details,
      'priority': priority.name,
      'is_anonymous': isAnonymous,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class SubmitComplaintRequest {
  final ComplaintType type;
   final String details;
  final ComplaintPriority priority;
  final bool isAnonymous;

  SubmitComplaintRequest({
    required this.type,
     required this.details,
    required this.priority,
    required this.isAnonymous,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
       'details': details,
      'priority': priority.name,
      'is_anonymous': isAnonymous,
    };
  }
}
