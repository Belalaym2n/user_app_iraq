import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/load_model.dart' show LoadModel;

showCancelLoadDialog(LoadModel load, BuildContext context) async {
  return showDialog(
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.warningColor,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(LocaleKeys.MyLoadsScreen_cancel.tr(),style: AppTextStyles.headlineLarge(),),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${LocaleKeys.MyLoadsScreen_areYouSureCancel.tr()} "${load.title}"?',
              style: AppTextStyles.bodyMedium(),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.errorColor.withOpacity(0.1),
                    AppColors.errorColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.errorColor.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.secondaryColor
                        ,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        LocaleKeys.MyLoadsScreen_cancelActionWill.tr(),
                        style:AppTextStyles.headlineMedium().copyWith(
                         ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('• ${LocaleKeys.MyLoadsScreen_markLoadCancelled.tr()}',

                  style: AppTextStyles.bodySmall().copyWith(
                    fontSize: AppConstants.w*0.033,
                   ),
                  ),
                  Text(
                    '• ${LocaleKeys.MyLoadsScreen_notifyAllTransporters.tr()}',
                    style: AppTextStyles.bodySmall().copyWith(
                      fontSize: AppConstants.w*0.033,
                    ),   ),
                  Text(
                    '• ${LocaleKeys.MyLoadsScreen_rejectAllPendingBids.tr()}',
                    style: AppTextStyles.bodySmall().copyWith(
                      fontSize: AppConstants.w*0.033,
                    ),   ),
                  Text( style: AppTextStyles.bodySmall().copyWith(
                    fontSize: AppConstants.w*0.033,
                  ),'• ${LocaleKeys.MyLoadsScreen_cannotBeUndone.tr()}'),
                ],
              ),
            ),

            /// عدد المزايدين
            // if (getLoadBids(load.id).isNotEmpty) ...[
            //   const SizedBox(height: 16),
            //   Container(
            //     padding: const EdgeInsets.all(12),
            //     decoration: BoxDecoration(
            //       color: AppColors.warningColor.withOpacity(0.1),
            //       borderRadius: BorderRadius.circular(8),
            //       border: Border.all(
            //           color: AppColors.warningColor.withOpacity(0.2)),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(Icons.group,
            //             color: AppColors.warningColor, size: 20),
            //         const SizedBox(width: 8),
            //         Text(
            //           '${getLoadBids(load.id).length} ${LocaleKeys.MyLoadsScreen_receivedBids.tr()}',
            //           style: TextStyle(
            //             color: AppColors.warningColor,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.canPop(context);
            },
            child: Text(

                style: AppTextStyles.titleLarge().copyWith(


                                            color: AppColors.secondaryColor

                ),
                LocaleKeys.MyLoadsScreen_keepLoad.tr()),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.errorColor,
                  AppColors.errorColor.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              child: Text(LocaleKeys.MyLoadsScreen_cancel.tr()),
            ),
          ),
        ],
      );
    },
    context: context,
  );
}
