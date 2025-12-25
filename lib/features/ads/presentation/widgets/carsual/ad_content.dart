import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

class AdContent extends StatelessWidget {
    AdContent({super.key, required this.ad,  this.isLoading=false});
  bool isLoading;
  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, children: [
            AdHeadline(text: ad.headline),
            SizedBox(height: AppConstants.h * 0.005),
            Row(
              children: [
                Expanded(child: AdDescription(text: ad.description)),
                SizedBox(width: AppConstants.w * 0.02),
                  AdCTAButton(
                    isLoading: isLoading,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class AdHeadline extends StatelessWidget {
  const AdHeadline({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: AppTextStyles.headlineMedium().copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
class AdDescription extends StatelessWidget {
  const AdDescription({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: AppTextStyles.bodySmall().copyWith(
        color: Colors.white.withOpacity(0.9),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,

    );

  }
}
class AdCTAButton extends StatelessWidget {
    AdCTAButton({super.key,  this.isLoading=false});
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.025,
        vertical: AppConstants.h * 0.006,
      ),
      decoration: BoxDecoration(
                 color:isLoading? Colors.white: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'View Details',
            style: AppTextStyles.labelMedium().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: AppConstants.w * 0.01),
          Icon(
            Icons.arrow_forward_rounded,
            size: AppConstants.w * 0.035,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
