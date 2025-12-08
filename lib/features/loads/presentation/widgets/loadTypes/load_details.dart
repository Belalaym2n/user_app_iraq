import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/load_model.dart' show LoadModel;
 class LoadDetails extends StatelessWidget {
  final LoadModel load;
  final ThemeData theme;

  const LoadDetails({
    Key? key,
    required this.load,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _LoadDetailChip(
            icon: Icons.category_rounded,
            text: load.title,
            color: AppColors.accentColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _LoadDetailChip(
            icon: Icons.fitness_center_rounded,
            text: "${load.weight.toStringAsFixed(0)} kg",
            color: AppColors.secondaryColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _LoadDetailChip(
            icon: Icons.local_shipping_rounded,
            text: load.vehicleType.name,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////
///                   🔽 SUB WIDGET BELOW 🔽                ///
///////////////////////////////////////////////////////////////

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyLarge().copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
