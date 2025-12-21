import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';
import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';

class LoadDetails extends StatelessWidget {
  final TripModel load;

  const LoadDetails({
    Key? key,
    required this.load,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(AppConstants.w*0.05),
      child: Row(
        children: [
          Expanded(
            child: _LoadDetailChip(
              icon: Icons.category_rounded,
              text:load.material.toString(),
              color: AppColors.accentColor,
            ),
          ),
          SizedBox(width: AppConstants.w * 0.022),
          Expanded(
            child: _LoadDetailChip(
              icon: Icons.fitness_center_rounded,
              text: load.weight.toString(),
              color: AppColors.secondaryColor,
            ),
          ),
          SizedBox(width: AppConstants.w * 0.022),
          Expanded(
            child: _LoadDetailChip(
              icon: Icons.local_shipping_rounded,
              text: load.vehicleType,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadDetailChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _LoadDetailChip({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.022,
        vertical: AppConstants.h * 0.012,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: AppConstants.w * 0.038,
            color: color,
          ),
          SizedBox(width: AppConstants.w * 0.016),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyLarge().copyWith(
                fontSize: AppConstants.w * 0.034,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
