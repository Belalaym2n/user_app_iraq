import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';
import 'last_trip_model.dart';
class TimelineEvent {
  final String title;
  final String description;
  final TripStatus status;
  final IconData icon;
  final DateTime timestamp;

  const TimelineEvent({
    required this.title,
    required this.description,
    required this.status,
    required this.icon,
    required this.timestamp,
  });

  bool get isGreen =>
      status == TripStatus.started ||
          status == TripStatus.accepted|| status == TripStatus.completed ;

  Color get color => status.color;

  String get formattedTime =>
      DateFormat('MMM dd, yyyy - HH:mm').format(timestamp);
}

extension TripStatusX on TripStatus {
  Color get color {
    switch (this) {
      case TripStatus.pending:
        return AppColors.warningColor;
      case TripStatus.accepted:
        return Colors.green;
      case TripStatus.started:
        return AppColors.primaryColor;
      case TripStatus.completed:
        return Colors.green;
      case TripStatus.cancelled:
        return AppColors.errorColor;
    }
  }

  double get progress {
    switch (this) {
      case TripStatus.pending:
        return 0.2;
      case TripStatus.accepted:
        return 0.4;
      case TripStatus.started:
        return 0.7;
      case TripStatus.completed:
        return 1.0;
      case TripStatus.cancelled:
        return 1.0;
    }
  }


}
