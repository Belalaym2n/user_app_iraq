
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

 import '../../../../data/models/load_model.dart' show LoadModel;
import '../../../../data/models/load_states.dart';
import 'cancel_button.dart';


Widget buildStatusBasedActionButton(
    LoadModel load  ,ThemeData theme,BuildContext context ) {
  switch (load.status) {
    case LoadStatus.posted:
    case LoadStatus.bidding:
    case LoadStatus.active:
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
                showCancelLoadDialog(load,context);
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
  //
  // case LoadStatus.assigned:
  // case LoadStatus.inProgress:
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [
  //           infoColor,
  //           infoColor.withOpacity(0.8),
  //         ],
  //       ),
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: infoColor.withOpacity(0.3),
  //           blurRadius: 8,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: ElevatedButton.icon(
  //       onPressed: () => controller.viewLoadDetails(load),
  //       icon: const Icon(Icons.track_changes_rounded, size: 16),
  //       label: const Text('Track'),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.transparent,
  //         foregroundColor: Colors.white,
  //         elevation: 0,
  //         padding: const EdgeInsets.symmetric(vertical: 12),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //       ),
  //     ),
  //   );
  //
  // default:
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [
  //           primaryColor,
  //           primaryLight,
  //         ],
  //       ),
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: primaryColor.withOpacity(0.3),
  //           blurRadius: 8,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: ElevatedButton.icon(
  //       onPressed: () => controller.viewLoadDetails(load),
  //       icon: const Icon(Icons.visibility_rounded, size: 16),
  //       label: const Text('View'),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.transparent,
  //         foregroundColor: Colors.white,
  //         elevation: 0,
  //         padding: const EdgeInsets.symmetric(vertical: 12),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //       ),
  //
  //   );
    case LoadStatus.assigned:
      // TODO: Handle this case.
      throw UnimplementedError();
    case LoadStatus.inProgress:
      // TODO: Handle this case.
      throw UnimplementedError();
    case LoadStatus.completed:
      // TODO: Handle this case.
      throw UnimplementedError();
    case LoadStatus.cancelled:
      // TODO: Handle this case.
      throw UnimplementedError();
    case LoadStatus.expired:
      // TODO: Handle this case.
      throw UnimplementedError();
    case LoadStatus.draft:
      // TODO: Handle this case.
      throw UnimplementedError();
  }}
