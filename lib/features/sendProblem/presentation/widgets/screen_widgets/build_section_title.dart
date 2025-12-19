import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

Widget buildProblemSectionTitle(String title, IconData icon) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(AppConstants.w * 0.022), // = 8 on 360 width
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppConstants.w * 0.022), // = 8
        ),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
          size: AppConstants.w * 0.055, // = 20
        ),
      ),

      SizedBox(width: AppConstants.w * 0.033), // = 12

      Text(
        title,
        style: TextStyle(
          fontSize: AppConstants.w * 0.050, // = 18
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    ],
  );
}
