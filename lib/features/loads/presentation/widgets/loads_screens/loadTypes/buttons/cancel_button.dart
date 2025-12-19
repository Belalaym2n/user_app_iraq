import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../data/models/last_trip_model.dart' show TripModel;
 import '../../../../bloc/getTripsBloc/trips_bloc.dart';
import '../../../../bloc/getTripsBloc/trips_events.dart';
import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../common_widgets/load_status.dart';
import '../common_widgets/load_wrapper.dart';
import '../bids_section.dart';
Future<void> showCancelLoadDialog({
  required BuildContext context,
  required TripModel load,
  required VoidCallback onConfirm,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.055),
        ),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.warningColor,
              size: AppConstants.w * 0.075,
            ),
            SizedBox(width: AppConstants.w * 0.033),
            Text(
              LocaleKeys.MyLoadsScreen_cancel.tr(),
              style: AppTextStyles.headlineLarge().copyWith(
                fontSize: AppConstants.w * 0.045,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.MyLoadsScreen_areYouSureCancel.tr(),
              style: AppTextStyles.bodyMedium().copyWith(
                fontSize: AppConstants.w * 0.036,
              ),
            ),
            SizedBox(height: AppConstants.h * 0.02),
            Container(
              padding: EdgeInsets.all(AppConstants.w * 0.04),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.errorColor.withOpacity(0.1),
                    AppColors.errorColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
                border: Border.all(
                  color: AppColors.errorColor.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet(
                      LocaleKeys.MyLoadsScreen_markLoadCancelled.tr()),
                  _buildBullet(
                      LocaleKeys.MyLoadsScreen_notifyAllTransporters.tr()),
                  _buildBullet(
                      LocaleKeys.MyLoadsScreen_rejectAllPendingBids.tr()),
                  _buildBullet(
                      LocaleKeys.MyLoadsScreen_cannotBeUndone.tr()),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              LocaleKeys.MyLoadsScreen_keepLoad.tr(),
              style: AppTextStyles.titleLarge().copyWith(
                fontSize: AppConstants.w * 0.038,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.errorColor,
                  AppColors.errorColor.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(AppConstants.w * 0.022),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // اقفل dialog
                onConfirm();            // نفّذ اللي اتبعت
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.w * 0.06,
                  vertical: AppConstants.h * 0.014,
                ),
              ),
              child: Text(
                LocaleKeys.MyLoadsScreen_cancel.tr(),
                style: TextStyle(fontSize: AppConstants.w * 0.036),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildBullet(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppConstants.h * 0.006),
    child: Text(
      '• $text',
      style: AppTextStyles.bodySmall().copyWith(
        fontSize: AppConstants.w * 0.033,
      ),
    ),
  );
}
