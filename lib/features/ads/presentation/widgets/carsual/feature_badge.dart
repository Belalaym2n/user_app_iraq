import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';


class FeaturedBadge extends StatelessWidget {
    FeaturedBadge({super.key,  this.isLoading=false});
bool isLoading;
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: AppConstants.h * 0.015,
      left: AppConstants.w * 0.03,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.w * 0.025,
          vertical: AppConstants.h * 0.006,
        ),
        decoration: BoxDecoration(
          color:isLoading?Colors.white:  AppColors.primaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.stars_rounded,
              size: AppConstants.w * 0.035,
              color: Colors.white,
            ),
            SizedBox(width: AppConstants.w * 0.015),
            Text(
              'Featured',
              style: AppTextStyles.labelMedium().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
