
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import 'ad_images_page_view.dart';


class AdDetailContent extends StatelessWidget {
  final AdModel ad;

  const AdDetailContent({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.w * 0.044),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ad.headline,
            style: AppTextStyles.displayMedium().copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppConstants.h * 0.02),
          const AdSectionTitle(title: 'About This Offer'),
          SizedBox(height: AppConstants.h * 0.01),
          AdDescriptionBox(description: ad.description),
          SizedBox(height: AppConstants.h * 0.03),
          const AdActionButton(),
        ],
      ),
    );
  }
}
class AdSectionTitle extends StatelessWidget {
  final String title;

  const AdSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: AppConstants.h * 0.025,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: AppConstants.w * 0.02),
        Text(
          title,
          style: AppTextStyles.headlineSmall().copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
class AdDescriptionBox extends StatelessWidget {
  final String description;

  const AdDescriptionBox({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.w * 0.04),
      decoration: BoxDecoration(
        color: AppColors.neutralGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: Text(
        description,
        style: AppTextStyles.bodyLarge().copyWith(
          color: AppColors.textSecondary,
          height: 1.6,
        ),
      ),
    );
  }
}
class AdActionButton extends StatelessWidget {
  const AdActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppConstants.h * 0.065,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {

          Navigator.pushNamed(context, AppRoutes.add_load);
          },
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Go TO Request Driver',
                  style: AppTextStyles.headlineSmall().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: AppConstants.w * 0.02),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: AppConstants.w * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
