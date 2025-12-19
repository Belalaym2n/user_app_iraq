import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/problem_category.dart';
import '../../bloc/events.dart';
import '../../bloc/problem_bloc.dart';
import '../../bloc/problem_states.dart';

class BuildProblemsCat extends StatelessWidget {
  const BuildProblemsCat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemBloc, ProblemState>(
      builder: (context, state) {
        final bloc = context.read<ProblemBloc>();

        return Wrap(
          spacing: AppConstants.w * 0.027,      // = 10
          runSpacing: AppConstants.h * 0.013,   // = 10
          children: categories.map((category) {
            final isSelected = bloc.selectedCategory == category;

            return InkWell(
              onTap: () {
                context
                    .read<ProblemBloc>()
                    .add(SelectProblemCategoryEvent(category));
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.w * 0.055,  // = 20
                  vertical: AppConstants.h * 0.015,    // = 12
                ),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryLight,
                    ],
                  )
                      : null,
                  color: isSelected ? null : AppColors.neutralGray,
                  borderRadius: BorderRadius.circular(
                    AppConstants.w * 0.069, // = 25
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getCategoryIcon(category),
                      size: AppConstants.w * 0.050, // = 18 تقريبًا
                      color:
                      isSelected ? Colors.white : AppColors.textSecondary,
                    ),
                    SizedBox(width: AppConstants.w * 0.022), // = 8
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: AppConstants.w * 0.038, // مناسب بدل 14
                        color:
                        isSelected ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Payment Issue':
        return Icons.payment;
      case 'Technical Problem':
        return Icons.build;
      case 'Account Issue':
        return Icons.account_circle;
      default:
        return Icons.help_outline;
    }
  }
}
