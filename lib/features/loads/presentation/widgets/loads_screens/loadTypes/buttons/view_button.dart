import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';
import 'package:user_app_iraq/features/loads/presentation/pages/load_detsils_screen.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import 'cancel_button.dart';

Widget buildStatusBasedActionButton(
  TripModel load,
  BuildContext context, {
  required VoidCallback onConfirmCancel,
}) {
  switch (load.status) {
    case TripStatus.pending:
    case TripStatus.accepted:
      return  _build_button(
          onTap: () {
            showCancelLoadDialog(
              context: context,
              load: load,
              onConfirm: () {
                onConfirmCancel();
              },
            );
          },
          color: AppColors.errorColor,
          buttonName: LocaleKeys.MyLoadsScreen_cancel.tr(),
          load,
          context,
          onConfirmCancel: onConfirmCancel,
    
      );

    case TripStatus.completed:
      // TODO: Handle this case.
      throw UnimplementedError();
    case TripStatus.cancelled:
      // TODO: Handle this case.
      throw UnimplementedError();
    case TripStatus.started:
      // TODO: Handle this case.
      return   _build_button(
  onTap: (){
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => LoadDetailsScreen(tripModel: load),
  ),
  );
  },
          color: AppColors.infoColor,
          buttonName: "Tracking",
          load,
          context,
          onConfirmCancel: onConfirmCancel,

      );
  }
}

_build_button(
  TripModel load,
  BuildContext context, {
required Function()? onTap,

      required String buttonName,
  required Color color,
  required VoidCallback onConfirmCancel,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [color, color.withOpacity(0.8)]),
      color: color,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: ElevatedButton.icon(
      onPressed:(){
        onTap!();
      },
      icon: SizedBox(
        width: 14,
        height: 14,
        child: const Icon(Icons.cancel_rounded, size: 16),
      ),
      label: Text(buttonName),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
