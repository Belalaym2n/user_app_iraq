import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/complaint_mode.dart';

class PriorityHelper {
  static Color getColor(ComplaintPriority priority) {
    switch (priority) {
      case ComplaintPriority.low:
        return AppColors.successColor;
      case ComplaintPriority.medium:
        return AppColors.infoColor;
      case ComplaintPriority.high:
        return AppColors.warningColor;
      case ComplaintPriority.urgent:
        return AppColors.errorColor;
    }
  }

  static IconData getIcon(ComplaintPriority priority) {
    switch (priority) {
      case ComplaintPriority.low:
        return Icons.flag_outlined;
      case ComplaintPriority.medium:
        return Icons.outlined_flag;
      case ComplaintPriority.high:
        return Icons.flag;
      case ComplaintPriority.urgent:
        return Icons.priority_high_rounded;
    }
  }
}

class  ComplaintTypeHelper {
  static IconData getIcon(ComplaintType type) {
    switch (type) {
      case ComplaintType.technical:
        return Icons.bug_report_outlined;
      case ComplaintType.service:
        return Icons.room_service_outlined;
      case ComplaintType.driver:
        return Icons.person_outline;
      case ComplaintType.payment:
        return Icons.payment_outlined;
      case ComplaintType.safety:
        return Icons.security_outlined;
      case ComplaintType.other:
        return Icons.help_outline;
    }
  }
}
