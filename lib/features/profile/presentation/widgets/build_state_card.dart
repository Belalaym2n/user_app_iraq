import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class BuildStateCard extends StatefulWidget {
  const BuildStateCard({super.key});

  @override
  State<BuildStateCard> createState() => _BuildStateCardState();
}

class _BuildStateCardState extends State<BuildStateCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              LocaleKeys.Profile_total_loads.tr(),
              "2",
              Icons.inventory_2_outlined,
              AppColors.primaryColor
            ),
          ),
           Expanded(
            child: _buildStatItem(
              LocaleKeys.Profile_completed.tr(),
              "3",

              Icons.check_circle_outline,
              Colors.green,
            ),
          ),
         ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildStatsDivider() {
    return Container(
      width: 1,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.primaryColor.withOpacity(0.3),
    );
  }
}
