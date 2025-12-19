
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

 import 'cancel_button.dart';


Widget buildStatusBasedActionButton(
    TripModel load  , BuildContext context,

    { required VoidCallback onConfirmCancel,}

    ) {
  switch (load.status) {
    case  TripStatus.pending:
    case TripStatus.started:
    case TripStatus.accepted:
      return Container(
        decoration: BoxDecoration(
            gradient:
            LinearGradient(
              colors: [
                AppColors.errorColor,
                AppColors.errorColor.withOpacity(0.8),
              ],
            ),
            color: AppColors.surfaceColor
            ,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.errorColor.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ]
        ),
        child: ElevatedButton.icon(
          onPressed:
              () {
                showCancelLoadDialog(
                  context: context,
                  load: load,
                  onConfirm: (){
                    onConfirmCancel();
                  });
              },
          icon: SizedBox(
            width: 14,
            height: 14,
            child:
         const Icon(Icons.cancel_rounded, size: 16),),
          label: Text(LocaleKeys.MyLoadsScreen_cancel.tr()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor:
            Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );



    case TripStatus.completed:
      // TODO: Handle this case.
      throw UnimplementedError();
    case TripStatus.cancelled:
      // TODO: Handle this case.
      throw UnimplementedError();
  }}
