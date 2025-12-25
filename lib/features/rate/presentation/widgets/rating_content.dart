import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/custom_loading.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/rate_header.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/star_rating.dart';
import 'package:user_app_iraq/features/rate/presentation/widgets/submit_rate_button.dart';
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

class RatingContent extends StatefulWidget {
  final int tripId;
  final String? tripTitle;

  RatingContent({required this.tripId, this.tripTitle});

  @override
  State<RatingContent> createState() => RatingContentState();
}

class RatingContentState extends State<RatingContent> {
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {

        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          constraints: BoxConstraints(
            minHeight: AppConstants.h * 0.4,
            maxHeight: AppConstants.h * 0.95,
          ),

          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Stack(
            children: [
              RatingForm(tripTitle: widget.tripTitle, descriptionController: desc),
              SubmitRateButton(tripId: widget.tripId, description: desc.text),
            ],
          ),

    );
  }
}

class RatingForm extends StatelessWidget {
  final String? tripTitle;

  RatingForm({this.tripTitle, required this.descriptionController});

  TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _HandleBar(),
          RateHeader(tripTitle: tripTitle),
          const StarsRating(),
          DescriptionInput(descriptionController: descriptionController),
          SizedBox(height: AppConstants.h * 0.12),
        ],
      ),
    );
  }
}

class _HandleBar extends StatelessWidget {
  const _HandleBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppConstants.h * 0.015),
      width: AppConstants.w * 0.12,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class DescriptionInput extends StatelessWidget {
  DescriptionInput({required this.descriptionController});

  TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.044,
        vertical: AppConstants.h * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: AppConstants.h * 0.02,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: AppConstants.w * 0.02),
              Text(
                'Share your feedback',
                style: AppTextStyles.headlineSmall().copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.h * 0.015),
          Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: AppColors.neutralGray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor, width: 1),
            ),
            child: TextField(
              controller: descriptionController,
              maxLines: 5,
              maxLength: 500,
              style: AppTextStyles.bodyLarge().copyWith(
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: 'Tell us about your experience...',
                hintStyle: AppTextStyles.bodyLarge().copyWith(
                  color: AppColors.textMuted,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(AppConstants.w * 0.04),
                counterStyle: AppTextStyles.bodySmall().copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
