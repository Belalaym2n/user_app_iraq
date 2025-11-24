import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class TopScreenWidget extends StatelessWidget {
  String text;
  IconButton? iconButton;
  IconData? screenIcon;
  bool showIcons;

  TopScreenWidget({
    super.key,
    this.iconButton,
    this.showIcons = true,
    this.screenIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.05,
        vertical: AppConstants.h * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.w * 0.08),
          bottomRight: Radius.circular(AppConstants.w * 0.08),
        ),
      ),
      child:showIcons==true? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButton == null
              ? Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: AppConstants.w * 0.07,
                )
              : iconButton!,

      _build_text(),

          Icon(
            screenIcon == null ? Icons.school : screenIcon,
            color: Colors.white,
            size: AppConstants.w * 0.07,
          ),
        ],
      ):Center(child: _build_text())
    );
  }

  Widget _build_text(){
    return Text(
      text,

      style: TextStyle(
        fontSize: AppConstants.w * 0.055,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
