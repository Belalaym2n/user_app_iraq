import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{
  // static const Color primaryColor=Color(0xFFe10b09);
  static const Color primaryColor = Color(0xFF1B4A72);
  static const Color primaryVariant = Color(0xFF0F2F4D);
  static const Color primaryLight = Color(0xFF3D6B99);
  // static const Color secondaryColor = Color(0xFFE67E22);
  static const Color secondaryColor = Color(0xFFd48246);
  static const Color secondaryLight = Color(0xFFF39C12);
  static const Color accentColor = Color(0xFFE67E22);

  static const Color errorColor = Color(0xFFE74C3C);
  static const Color warningColor = Color(0xFFE67E22);
  static const Color successColor = Color(0xFF27AE60);
  static const Color infoColor = Color(0xFF3498DB);

  static const Color gradientStart = Color(0xFF1B4A72);
  static const Color gradientEnd = Color(0xFFE67E22);

  static const Color backgroundColor = Color(0xFFFAFBFD);
  static final Color surfaceColor = Colors.white;
  static const Color cardColor = Color(0xFFFEFEFE);
  static const Color neutralGray = Color(0xFFF8F9FB);
  static const Color borderColor = Color(0xFFE8ECF0);
  static const Color shimmerColor = Color(0xFFF0F2F5);

  static const Color textPrimary = Color(0xFF1B4A72);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);

}
// features/ads/data/models/ad_model.dart

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