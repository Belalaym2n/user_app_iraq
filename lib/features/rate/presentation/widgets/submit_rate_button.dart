import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/custom_loading.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/rate_header.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/rating_content.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/star_rating.dart';
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

class SubmitRateButton extends StatelessWidget {
  final int tripId;
  String description;

  SubmitRateButton({required this.description, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: BlocBuilder<RatingBloc, RatingState>(
        builder: (context, state) {
           final rating = state is RatingWithData ? state.rating : 0.0;

          return Container(
            padding: EdgeInsets.all(AppConstants.w * 0.044),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: _GradientButton(
               onTap: () => _submitRating(context, rating),
            ),
          );
        },
      ),
    );
  }

  void _submitRating(BuildContext context, double rating) {
     final descriptionInputState = context
        .findAncestorStateOfType<RatingContentState>();

    final description = descriptionInputState?.desc ?? '';

    final request = SubmitRatingRequest(
      tripId: tripId,
      rating: rating,
      description: description.toString().trim(),
    );

    context.read<RatingBloc>().add(SubmitRatingEvent(request));
  }
}

class _GradientButton extends StatelessWidget {
   final VoidCallback? onTap;

  const _GradientButton({  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppConstants.h * 0.065,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.white,
                        size: AppConstants.w * 0.055,
                      ),
                      SizedBox(width: AppConstants.w * 0.02),
                      Text(
                        'Submit Rating',
                        style: AppTextStyles.headlineSmall().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
