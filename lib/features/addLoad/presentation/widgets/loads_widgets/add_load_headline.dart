import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class AddLoadHeadline extends StatefulWidget {
  AddLoadHeadline({super.key, this.isLoading = false});
  bool isLoading;

  @override
  State<AddLoadHeadline> createState() => _AddLoadHeadlineState();
}

class _AddLoadHeadlineState extends State<AddLoadHeadline> {


  @override
  Widget build(BuildContext context) {
    return _buildWelcomeHeader();
  }

  Widget _buildWelcomeHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        AppConstants.w * 0.066, // 24 / 360
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.isLoading ? Colors.white : AppColors.primaryColor,
            widget.isLoading ? Colors.white : AppColors.primaryVariant,
          ],
        ),
        borderRadius: BorderRadius.circular(
          AppConstants.w * 0.055, // 20 / 360
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: AppConstants.w * 0.041, // 15 / 360
            offset: Offset(
              0,
              AppConstants.h * 0.010, // 8 / 776
            ),
          ),
        ],
      ),
      child: _build_content(),
    );
  }

  Widget _build_car_icon() {
    return Container(
      padding: EdgeInsets.all(
        AppConstants.w * 0.044, // 16 / 360
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          AppConstants.w * 0.044, // 16 / 360
        ),
      ),
      child: Icon(
        Icons.local_shipping_outlined,
        size: AppConstants.w * 0.133, // 48 / 360
        color: Colors.white,
      ),
    );
  }

  Widget _build_post_text() {
    return Text(
      LocaleKeys.Home_post_load.tr(),
      style: TextStyle(
        color: Colors.white,
        fontSize: AppConstants.w * 0.066, // 24 / 360
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _build_description() {
    return Text(
      LocaleKeys.Add_Load_getCompetitiveBids.tr(),
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: AppConstants.w * 0.044, // 16 / 360
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _build_content() {
    return Column(
      children: [
        _build_car_icon(),
        SizedBox(height: AppConstants.h * 0.020), // 16 / 776
        _build_post_text(),
        SizedBox(height: AppConstants.h * 0.010), // 8 / 776
        _build_description()
      ],
    );
  }
}