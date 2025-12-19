import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../addLoad/data/models/load_model.dart';
import '../../../../../data/models/last_trip_model.dart';

Color getStatusColor(TripStatus status) {
  switch (status) {
    case TripStatus.pending:
    case TripStatus.started:
      return AppColors.primaryColor;
    case TripStatus.cancelled:
      return AppColors.errorColor;

    case TripStatus.completed:
      return AppColors.successColor;

    case TripStatus.accepted:
      return AppColors.successColor;
  }
}
