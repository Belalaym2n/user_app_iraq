import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/location_model.dart';
import '../../../bloc/add_load_bloc.dart';
import '../../../bloc/add_load_event.dart';
import '../../../bloc/add_load_states.dart';

Widget buildItem(
  BuildContext context, {
  required String title,
  required IconData icon,
  required Color color,
  required bool isPickup,
}) {
  return BlocBuilder<AddLoadBloc, AddLoadState>(
    builder: (context, state) {
      LoadLocationModel? location = isPickup
          ? state.pickupLocation
          : state.deliveryLocation;

      return GestureDetector(
        onTap: () {
          context.read<AddLoadBloc>().add(
            GetCurrentLocationEvent(isPickup: isPickup),
          );
        },
        child: Container(
          padding: EdgeInsets.all(
            AppConstants.w * 0.038, // 14 / 360
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(
              AppConstants.w * 0.033, // 12 / 360
            ),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Row(
            children: [
              _buildIcon(icon),
              SizedBox(width: AppConstants.w * 0.033), // 12 / 360
              Expanded(child: _buildTexts(title, location)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: AppConstants.w * 0.055, // 20 / 360
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildTexts(String title, LoadLocationModel? location) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: AppTextStyles.bodyLarge()),
      Text(
        location?.address ?? LocaleKeys.Add_Load_tapToSelectLocation.tr(),
        //"Tap to select location",
        style: AppTextStyles.bodySmall().copyWith(
          color: location != null ? Colors.green : Colors.grey,
        ),
      ),
    ],
  );
}

Widget _buildIcon(IconData icon) {
  return Container(
    padding: EdgeInsets.all(
      AppConstants.w * 0.027, // 10 / 360
    ),
    decoration: BoxDecoration(
      color: Colors.grey[400],
      borderRadius: BorderRadius.circular(
        AppConstants.w * 0.033, // 12 / 360
      ),
    ),
    child: Icon(
      icon,
      color: Colors.white,
      size: AppConstants.w * 0.055, // 20 / 360
    ),
  );
}
