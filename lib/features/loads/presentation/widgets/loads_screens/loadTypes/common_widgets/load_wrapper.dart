import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';

import '../../../../../data/models/last_trip_model.dart';
import '../build_load_route.dart';
import '../load_details.dart';
import 'build_load_header.dart';

class LoadWrapper extends StatefulWidget {
  LoadWrapper({
    super.key,
    required this.load,
    required this.child,
  });

  final TripModel load;
  final Widget child;

  @override
  State<LoadWrapper> createState() => _LoadWrapperState();
}

class _LoadWrapperState extends State<LoadWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.w * 0.055),
      child: Container(
        margin: EdgeInsets.only(
          bottom: AppConstants.h * 0.021,
          top: AppConstants.h * 0.010,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(AppConstants.w * 0.055),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.06),
              blurRadius: AppConstants.w * 0.055,
              offset: Offset(0, AppConstants.h * 0.010),
            ),
          ],
        ),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.w * 0.055),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadHeader(load: widget.load),
                  SizedBox(height: AppConstants.h * 0.021),
                  RouteInfo(load: widget.load),
                  SizedBox(height: AppConstants.h * 0.021),
                  LoadDetails(load: widget.load),
                  widget.child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
