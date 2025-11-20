import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class AddLoadHeadline extends StatefulWidget {
  const AddLoadHeadline({super.key});

  @override
  State<AddLoadHeadline> createState() => _AddLoadHeadlineState();
}

class _AddLoadHeadlineState extends State<AddLoadHeadline> {
  @override
  Widget build(BuildContext context) {
    return   _buildWelcomeHeader();
  }
  Widget _buildWelcomeHeader(   ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryVariant,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.local_shipping_outlined,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.Home_post_load.tr() ,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.Add_Load_getCompetitiveBids.tr(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}
