import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../../core/utils/app_colors.dart';

class BuildIcon extends StatefulWidget {
  BuildIcon({super.key, required this.iconData});
  IconData iconData;

  @override
  State<BuildIcon> createState() => _BuildIconState();
}

class _BuildIconState extends State<BuildIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.w * 0.085,   // بدل 32
      height: AppConstants.w * 0.085,  // بدل 32
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.20),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.025), // بدل 10
        border: Border.all(
          color: Colors.white.withOpacity(0.30),
          width: AppConstants.w * 0.003, // بدل 1
        ),
      ),
      child: Center(
        child: Icon(
          widget.iconData,
          color: AppColors.primaryColor,
          size: AppConstants.w * 0.08, // بدل 24
        ),
      ),
    );
  }
}
