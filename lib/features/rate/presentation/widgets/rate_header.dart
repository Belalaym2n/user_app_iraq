
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
class RateHeader   extends StatelessWidget {
  final String? tripTitle;

  const RateHeader({this.tripTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.w * 0.044),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppConstants.w * 0.04),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.star_rounded,
              size: AppConstants.w * 0.12,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: AppConstants.h * 0.02),
          Text(
            'Rate Your Experience',
            style: AppTextStyles.displayMedium().copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (tripTitle != null) ...[
            SizedBox(height: AppConstants.h * 0.01),
            Text(
              tripTitle!,
              style: AppTextStyles.bodyMedium().copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
