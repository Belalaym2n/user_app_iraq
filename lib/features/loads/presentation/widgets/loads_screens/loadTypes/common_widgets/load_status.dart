import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
 import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../data/models/last_trip_model.dart';
import 'color_status.dart';

Widget buildEnhancedLoadStatus(TripModel load) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  getStatusColor(load.status),
                  getStatusColor(load.status).withOpacity(0.7),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: getStatusColor(load.status).withOpacity(0.3),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  getStatusColor(load.status,  ).withOpacity(0.15),
                  getStatusColor(load.status,  ).withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: getStatusColor(load.status,  ).withOpacity(0.2),
              ),
            ),
            child: Text(
              load.status.name,
              style:  AppTextStyles.bodySmall().copyWith(
                color: getStatusColor(load.status,),
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 12,
              color: AppColors.surfaceColor,
            ),
            const SizedBox(width: 4),
            Text(
           LocaleKeys.MyLoadsScreen_posted.tr(),
              style:AppTextStyles. bodySmall().copyWith(
                // color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


