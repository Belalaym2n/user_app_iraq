import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/driver_info.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/common_widgets/build_widget_header.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class ContactDriver extends StatelessWidget {
  ContactDriver({super.key,  this.offerModel,
    this.isHidden = false});

  bool isHidden;
  OfferModel? offerModel;

  @override
  Widget build(BuildContext context) {
    return buildWidgetHeaderOnTrip(
      icon: Icons.person_outline,
      name: LocaleKeys.MyLoadsScreen_driverDetails.tr(),
      child: Column(
        children: [
          SizedBox(height: AppConstants.h * 0.02),
          _buildContactCard(
            isHidden: isHidden,

            icon: Icons.person_outline,
            label: LocaleKeys.MyLoadsScreen_contactDriver.tr(),
            value: offerModel?.driver.user.name??'',
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            isHidden: isHidden,
            icon: Icons.phone_outlined,
            label: LocaleKeys.MyLoadsScreen_message.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String label,
    String? value,
    required bool isHidden,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryColor, size: 24),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 6),
                isHidden ? _buildHiddenBadge() : build_value(icon, value),
              ],
            ),
          ),
        ],
      ),
    );
  }

  build_value(IconData icon, String? value) {
    return   value != null ?Row(
      children: [
     Icon(icon, size: 14, color: Colors.grey.shade700),

            Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              )

      ],
    ): Row(
    children: [
    Text(
    LocaleKeys.MyLoadsScreen_contactDriver.tr(),
    style: TextStyle(
    fontSize: 13,
    color: Colors.grey.shade700,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    ),
    )
    ,Spacer(),
      Icon(Icons.chat, size:25, color: AppColors.infoColor),
    ],
    );
  }

  Widget _buildHiddenBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.visibility_off_outlined,
            size: 14,
            color: Colors.grey.shade700,
          ),
          const SizedBox(width: 6),
          Text(
            'Hidden',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
