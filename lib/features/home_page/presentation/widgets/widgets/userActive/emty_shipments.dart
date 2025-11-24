import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../../../core/utils/app_constants.dart';

class EmptyShipmentsWidget extends StatelessWidget {
  const EmptyShipmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, AppConstants.h * 0.02 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.w * 0.06, // بدل 32
          vertical: AppConstants.h * 0.015,  // بدل 12
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.w * 0.05),
          elevation: 8,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.w * 0.08, // بدل 32
              vertical: AppConstants.h * 0.035,  // بدل 30
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppConstants.w * 0.055),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: AppConstants.w * 0.035,
                  offset: Offset(0, AppConstants.h * 0.008),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildIcon(),
                SizedBox(height: AppConstants.h * 0.025), // بدل 22
                _buildNoActiveText(),
                SizedBox(height: AppConstants.h * 0.01),  // بدل 8
                _buildDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      LocaleKeys.Home_active_shipments_info.tr(),
      style: AppTextStyles.bodyMedium().copyWith(
        color: AppColors.textSecondary,
        height: 1.6,
        fontSize: AppConstants.w * 0.035, // ~14
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildNoActiveText() {
    return Text(
      LocaleKeys.Home_no_active_shipments.tr(),
      style: AppTextStyles.titleMedium().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: AppConstants.w * 0.04, // ~17
        color: AppColors.textPrimary,
        letterSpacing: 0.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildIcon() {
    return Container(
      width: AppConstants.w * 0.22,  // بدل 90
      height: AppConstants.w * 0.22, // بدل 90
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.25),
          width: AppConstants.w * 0.005, // بدل 1.8
        ),
      ),
      child: Icon(
        Icons.local_shipping_outlined,
        size: AppConstants.w * 0.1, // بدل 42
        color: Colors.white,
      ),
    );
  }
}
