import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/rate_header.dart';
import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/app_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/sharedWidgets/text_styles.dart';
import '../../data/models/rate_model.dart';
import '../../domain/use_cases/send_rate_use_case.dart';
import '../RateBloc/rate_bloc.dart';
import '../RateBloc/rate_events.dart';
import '../RateBloc/rate_states.dart';

class StarsRating extends StatelessWidget {
  const StarsRating();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (context, state) {
        final rating = state is RatingWithData ? state.rating : 0.0;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w * 0.044,
            vertical: AppConstants.h * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How would you rate this trip?',
                style: AppTextStyles.headlineSmall().copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppConstants.h * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starValue = index + 1.0;
                  return _StarButton(
                    value: starValue,
                    isSelected: rating >= starValue,
                    onTap: () => context
                        .read<RatingBloc>()
                        .add(UpdateRatingEvent(starValue)),
                  );
                }),
              ),
              if (rating > 0) ...[
                SizedBox(height: AppConstants.h * 0.015),
                Center(
                  child: Text(
                    _getRatingText(rating),
                    style: AppTextStyles.headlineMedium().copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _getRatingText(double rating) {
    if (rating == 1) return 'Poor';
    if (rating == 2) return 'Fair';
    if (rating == 3) return 'Good';
    if (rating == 4) return 'Very Good';
    if (rating == 5) return 'Excellent';
    return '';
  }
}
class _StarButton extends StatelessWidget {
  final double value;
  final bool isSelected;
  final VoidCallback onTap;

  const _StarButton({
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(AppConstants.w * 0.02),
        child: Icon(
          isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
          size: AppConstants.w * 0.12,
          color: isSelected ? AppColors.secondaryColor : AppColors.borderColor,
        ),
      ),
    );
  }
}
