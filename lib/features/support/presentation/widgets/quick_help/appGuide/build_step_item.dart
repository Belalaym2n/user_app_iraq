import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../data/models/guide_steps.dart';
import 'build_app_guide_header.dart';
import 'build_quide_pages_view.dart';

Widget buildAppGuideStepPage(GuideStep step) {
  return SingleChildScrollView(
    padding: EdgeInsets.all(
      AppConstants.w * 0.066, // 24 / 360
    ),
    child: Column(
      children: [
        // Icon + Animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                padding: EdgeInsets.all(
                  AppConstants.w * 0.066, // 24 / 360
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      step.color.withOpacity(0.2),
                      step.color.withOpacity(0.1),
                    ],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: step.color.withOpacity(0.3),
                    width: AppConstants.w * 0.0055, // 2 / 360
                  ),
                ),
                child: Icon(
                  step.icon,
                  size: AppConstants.w * 0.194, // 70 / 360
                  color: step.color,
                ),
              ),
            );
          },
        ),

        SizedBox(height: AppConstants.h * 0.031), // 24 / 776

        _build_tiltle(step.title),

        // Title
        SizedBox(height: AppConstants.h * 0.015), // 12 / 776
        // Description
        _build_description(step.description),

        SizedBox(height: AppConstants.h * 0.041), // 32 / 776
        // Steps List
        _build_steps(step),
      ],
    ),
  );
}

Widget _build_steps(GuideStep step) {
  return Container(
    padding: EdgeInsets.all(
      AppConstants.w * 0.055, // 20 / 360
    ),
    decoration: BoxDecoration(
      color: step.color.withOpacity(0.05),
      borderRadius: BorderRadius.circular(
        AppConstants.w * 0.044, // 16 / 360
      ),
      border: Border.all(
        color: step.color.withOpacity(0.15),
        width: AppConstants.w * 0.003, // 1 / 360
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: step.steps.asMap().entries.map((entry) {
        return _buildStepItem(entry.key + 1, entry.value, step.color);
      }).toList(),
    ),
  );
}

Widget _build_description(String description) {
  return Text(
    description,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: AppConstants.w * 0.041, // 15 / 360
      color: AppColors.textSecondary,
      height: 1.5,
    ),
  );
}

Widget _build_tiltle(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: AppConstants.w * 0.066, // 24 / 360
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );
}

Widget _buildStepItem(int number, String text, Color color) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: AppConstants.h * 0.020, // 16 / 776
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Number Circle
        Container(
          width: AppConstants.w * 0.088, // 32 / 360
          height: AppConstants.w * 0.088, // 32 / 360
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: AppConstants.w * 0.022, // 8 / 360
                offset: Offset(0, AppConstants.h * 0.003), // 2 / 776
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: AppConstants.w * 0.038, // 14 / 360
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(width: AppConstants.w * 0.033), // 12 / 360
        // Text
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppConstants.h * 0.005, // 4 / 776
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: AppConstants.w * 0.041, // 15 / 360
                color: AppColors.textPrimary,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
