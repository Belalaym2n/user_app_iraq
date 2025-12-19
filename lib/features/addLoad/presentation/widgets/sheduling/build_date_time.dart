import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

Widget buildDateTimeTile({
  required String title,
  required DateTime? dateTime,
  required VoidCallback onTap,
  required IconData icon,
  required Color color,
}) {
  final hasDateTime = dateTime != null;

  return Material(
    borderRadius: BorderRadius.circular(
      AppConstants.w * 0.044, // 16 / 360
    ),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(
        AppConstants.w * 0.044, // 16 / 360
      ),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(
          AppConstants.w * 0.050, // 18 / 360
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppConstants.w * 0.044, // 16 / 360
          ),
          border: Border.all(
            color: hasDateTime ? color : Colors.grey.shade300,
            width: hasDateTime ? 2 : 1,
          ),
          color: hasDateTime ? color.withOpacity(0.08) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: hasDateTime
                  ? color.withOpacity(0.25)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: hasDateTime
                  ? AppConstants.w * 0.027  // 10 / 360
                  : AppConstants.w * 0.016, // 6 / 360
              offset: Offset(
                0,
                AppConstants.h * 0.005, // 4 / 776
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                AppConstants.w * 0.027, // 10 / 360
              ),
              decoration: BoxDecoration(
                color: hasDateTime ? color : Colors.grey[400],
                borderRadius: BorderRadius.circular(
                  AppConstants.w * 0.033, // 12 / 360
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: AppConstants.w * 0.055, // 20 / 360
              ),
            ),
            SizedBox(width: AppConstants.w * 0.044), // 16 / 360

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstants.w * 0.038, // 14 / 360
                    ),
                  ),
                  SizedBox(height: AppConstants.h * 0.005), // 4 / 776
                  Text(
                    hasDateTime
                        ? DateFormat('MMM dd, yyyy - hh:mm a')
                        .format(dateTime)
                        : LocaleKeys.Add_Load_tapToSelect.tr(),
                    style: TextStyle(
                      fontSize: AppConstants.w * 0.041, // 15 / 360
                      color: hasDateTime ? Colors.black87 : Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              hasDateTime ? Icons.check_circle : Icons.arrow_forward_ios,
              size: AppConstants.w * 0.055, // 20 / 360
              color: hasDateTime ? color : Colors.grey[400],
            ),
          ],
        ),
      ),
    ),
  );
}