import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/features/loads/data/models/load_model.dart' show LoadModel;

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../generated/locale_keys.g.dart';


class EnhancedLoadDetailsCardSectionOnScreen extends StatelessWidget {
  final LoadModel load;

  const EnhancedLoadDetailsCardSectionOnScreen({
    Key? key,
    required this.load,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: _buildCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildLoadTypeAndWeight(),
          const SizedBox(height: 12),
          _buildVehicleAndPriority(),
          if (_hasDimensions) ...[
            const SizedBox(height: 12),
            _buildDimensionsCard(),
          ],
          if (_hasDescription) ...[
            const SizedBox(height: 16),
            _buildDescriptionSection(),
          ],
          if (_hasRequirements) ...[
            const SizedBox(height: 16),
            _buildRequirementsSection(),
          ],
        ],
      ),
    );
  }

  // ============== Card Decoration ==============

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.borderColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // ============== Header ==============

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.inventory_2_rounded,
            color: AppColors.primaryColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          LocaleKeys.MyLoadsScreen_loadDetails.tr(),
          style: AppTextStyles.headlineMedium(),
        ),
      ],
    );
  }

  // ============== Load Type & Weight ==============

  Widget _buildLoadTypeAndWeight() {
    return Row(
      children: [
        Expanded(
          child: _DetailCard(
            icon: Icons.category_rounded,
            label: LocaleKeys.Add_Load_materialType.tr(),
            value: load.vehicleType.name,
            iconColor: AppColors.infoColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _DetailCard(
            icon: Icons.fitness_center_rounded,
            label: LocaleKeys.MyLoadsScreen_weight.tr(),
            value: '${load.weight.toStringAsFixed(0)} ${LocaleKeys.MyLoadsScreen_kg.tr()}',
            iconColor: AppColors.warningColor,
          ),
        ),
      ],
    );
  }

  // ============== Vehicle & Priority ==============

  Widget _buildVehicleAndPriority() {
    return Row(
      children: [
        Expanded(
          child: _DetailCard(
            icon: Icons.local_shipping_rounded,
            label: LocaleKeys.Add_Load_vehicleType.tr(),
            value: load.vehicleType.name,
            iconColor: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _DetailCard(
            icon: Icons.schedule_rounded,
            label: LocaleKeys.MyLoadsScreen_priorityVehicleRequired.tr(),
            value: load.isUrgent
                ? LocaleKeys.MyLoadsScreen_urgent.tr()
                : 'عادي',
            iconColor: load.isUrgent
                ? AppColors.errorColor
                : AppColors.successColor,
          ),
        ),
      ],
    );
  }

  // ============== Dimensions ==============

  Widget _buildDimensionsCard() {
    return _DetailCard(
      icon: Icons.straighten_rounded,
      label: LocaleKeys.Add_Load_dimensions.tr(),
      value: load.dimensions!,
      iconColor: AppColors.secondaryColor,
      fullWidth: true,
    );
  }

  // ============== Description ==============

  Widget _buildDescriptionSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.neutralGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.MyLoadsScreen_description.tr(),
            style: AppTextStyles.labelLarge().copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            load.description!,
            style: AppTextStyles.bodyMedium(),
          ),
        ],
      ),
    );
  }

  // ============== Requirements ==============

  Widget _buildRequirementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المتطلبات',
          style: AppTextStyles.labelLarge().copyWith(
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: load.requirements.map((req) {
            return _RequirementChip(requirement: req);
          }).toList(),
        ),
      ],
    );
  }

  // ============== Helpers ==============

  bool get _hasDimensions => load.dimensions?.isNotEmpty == true;
  bool get _hasDescription => load.description?.isNotEmpty == true;
  bool get _hasRequirements => load.requirements.isNotEmpty;
}

// ============== Detail Card Widget ==============

class _DetailCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final bool fullWidth;

  const _DetailCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.bodySmall().copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.headlineSmall(),
                  maxLines: fullWidth ? 2 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============== Requirement Chip Widget ==============

class _RequirementChip extends StatelessWidget {
  final String requirement;

  const _RequirementChip({
    Key? key,
    required this.requirement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.3),
        ),
      ),
      child: Text(
        requirement,
        style: AppTextStyles.bodySmall().copyWith(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}