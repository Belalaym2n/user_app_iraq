import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
 import 'package:user_app_iraq/features/profile/data/models/profile_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class BuildStateCard extends StatefulWidget {
    BuildStateCard({super.key,required this.profileModel});
UserProfileModel profileModel;
  @override
  State<BuildStateCard> createState() => _BuildStateCardState();
}

class _BuildStateCardState extends State<BuildStateCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.022, // بدل 8
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.h * 0.022,  // بدل 18
          horizontal: AppConstants.w * 0.027, // بدل 10
        ),
        child: Row(
          children: [

            /// LEFT CARD
            SizedBox(
              width: AppConstants.w * 0.36,   // نفس القيمة الأصلية
              height: AppConstants.w * 0.36,  // نفس القيمة الأصلية
              child: _buildStatItemCard(
                title: LocaleKeys.Profile_total_loads.tr(),
                value: widget.profileModel.tripStatistics?.totalTrips.toString()??'0',
                icon: Icons.inventory_2_outlined,
                color: AppColors.primaryColor,
              ),
            ),

            /// DIVIDER
            _buildDivider(),

            /// RIGHT CARD
            SizedBox(
              width: AppConstants.w * 0.36,
              height: AppConstants.w * 0.36,
              child: _buildStatItemCard(
                title: LocaleKeys.Profile_completed.tr(),
                value:  widget.profileModel.tripStatistics?.completedTrips.toString()??'0',
                icon: Icons.check_circle_outline,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItemCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(AppConstants.w * 0.05), // بدل 18
      shadowColor: color.withOpacity(0.2),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.h * 0.017, // بدل 14
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.05), // بدل 18
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatItemIcon(icon, color),
            SizedBox(height: AppConstants.h * 0.012), // بدل 10
            _buildStatItemValue(value, color),
            SizedBox(height: AppConstants.h * 0.006), // بدل 4
            _buildStatItemTitle(title),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItemIcon(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(AppConstants.w * 0.027), // بدل 10
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: AppConstants.w * 0.06, // بدل 22
      ),
    );
  }

  Widget _buildStatItemValue(String value, Color color) {
    return Text(
      value,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppConstants.w * 0.055, // بدل 20
        color: color,
      ),
    );
  }

  Widget _buildStatItemTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: AppConstants.w * 0.033, // بدل 12
        height: 1.3,
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: AppConstants.w * 0.003, // بدل 1
      height: AppConstants.h * 0.07, // بدل 55
      color: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.033, // بدل 12
      ),
    );
  }
}
