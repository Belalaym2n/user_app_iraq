import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../common/helpers.dart';
class PrioritySection extends StatelessWidget {
  final ComplaintPriority selectedPriority;
  final ValueChanged<ComplaintPriority> onPrioritySelected;

  const PrioritySection({
    super.key,
    required this.selectedPriority,
    required this.onPrioritySelected,
  });

  @override
  Widget build(BuildContext context) {
    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            icon: Icons.priority_high_outlined,
            title: 'Priority Level',
            subtitle: 'How urgent is this issue?',
          ),
          SizedBox(height: AppConstants.h * 0.02),
          Row(
            children: ComplaintPriority.values.map((priority) {
              final isLast = priority == ComplaintPriority.urgent;
              return Expanded(
                child: _PriorityCard(
                  priority: priority,
                  isSelected: selectedPriority == priority,
                  onTap: () => onPrioritySelected(priority),
                  hasMargin: !isLast,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _PriorityCard extends StatelessWidget {
  final ComplaintPriority priority;
  final bool isSelected;
  final VoidCallback onTap;
  final bool hasMargin;

  const _PriorityCard({
    required this.priority,
    required this.isSelected,
    required this.onTap,
    this.hasMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = PriorityHelper.getColor(priority);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: EdgeInsets.only(right: hasMargin ? AppConstants.w * 0.02 : 0),
        padding: EdgeInsets.symmetric(vertical: AppConstants.h * 0.018),
        decoration: BoxDecoration(
          color: isSelected ? color : AppColors.neutralGray,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : AppColors.borderColor,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
               PriorityHelper.getIcon(priority),
              color: isSelected ? Colors.white : AppColors.textPrimary,
              size: AppConstants.w * 0.07,
            ),
            SizedBox(height: AppConstants.h * 0.008),
            Text(
              complaintPriorityToString(priority),
              style: AppTextStyles.bodySmall().copyWith(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                fontSize: AppConstants.w * 0.028,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class _CardContainer extends StatelessWidget {
  final Widget child;

  const _CardContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.044),
      padding: EdgeInsets.all(AppConstants.w * 0.044),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(AppConstants.w * 0.025),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: AppConstants.w * 0.055, color: Colors.white),
        ),
        SizedBox(width: AppConstants.w * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.headlineMedium().copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppConstants.h * 0.002),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

