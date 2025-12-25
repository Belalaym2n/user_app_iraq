import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/complaint/presentation/widgets/widgetItems/section_header.dart';
import '../../../../../core/intialization/init_di.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../../data/models/complaint_mode.dart';
import '../../../domain/use_cases/send_complaint_use_case.dart';
import '../../complainBloc/complaint_blpc.dart';
import '../../complainBloc/complaint_events.dart';
import '../../complainBloc/copmlaint_states.dart';
import '../../pages/complaint_page.dart';
import '../common/build_card_continer.dart';
import '../common/helpers.dart';
class ComplaintTypeSection extends StatelessWidget {
  final ComplaintType? selectedType;
  final ValueChanged<ComplaintType> onTypeSelected;

  const ComplaintTypeSection({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: Icons.category_outlined,
            title: 'Complaint Type',
            subtitle: 'Select the category that best describes your issue',
          ),
          SizedBox(height: AppConstants.h * 0.02),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ComplaintType.values.map((type) {
                final isSelected = selectedType == type;
                return _SelectableChip(
                  label: complaintTypeToString(type),
                  icon: ComplaintTypeHelper.getIcon(type),
                  isSelected: isSelected,
                  onTap: () => onTypeSelected(type),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================
// MODULE: PRIORITY SELECTION
// ============================================


class _SelectableChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w * 0.025,
            vertical: AppConstants.h * 0.014,
          ),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.8),
              ],
            )
                : null,
            color: isSelected ? null : AppColors.neutralGray,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: AppConstants.w * 0.05,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
              SizedBox(width: AppConstants.w * 0.02),
              Text(
                label,
                style: AppTextStyles.bodyMedium().copyWith(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SelectableChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w * 0.045,
            vertical: AppConstants.h * 0.014,
          ),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.8),
              ],
            )
                : null,
            color: isSelected ? null : AppColors.neutralGray,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: AppConstants.w * 0.05,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
              SizedBox(width: AppConstants.w * 0.02),
              Text(
                label,
                style: AppTextStyles.bodyMedium().copyWith(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

