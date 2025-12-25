import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/offers/detailsScreen/offers_on_details_screen.dart';
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
import '../widgetItems/complaint_type_section.dart' hide ComplaintTypeSection;

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
   final IconData icon;
  final String text;

  const GradientButton({
    required this.onPressed,
     required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppConstants.h * 0.068,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(14),
          child: Center(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: AppConstants.w * 0.06),
                SizedBox(width: AppConstants.w * 0.025),
                Text(
                  text,
                  style: AppTextStyles.headlineMedium().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
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

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(AppConstants.w * 0.08),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                strokeWidth: 3.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryColor),
              ),
              SizedBox(height: AppConstants.h * 0.025),
              Text(
                'Submitting Complaint...',
                style: AppTextStyles.headlineSmall().copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppConstants.h * 0.008),
              Text(
                'Please wait',
                style: AppTextStyles.bodySmall().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
