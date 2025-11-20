import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class NoLoadsFound extends StatefulWidget {
  const NoLoadsFound({super.key});

  @override
  State<NoLoadsFound> createState() => _NoLoadsFoundState();
}

class _NoLoadsFoundState extends State<NoLoadsFound> {
  @override
  Widget build(BuildContext context) {
    return   _buildEnhancedEmptyState();
  }

  Widget _buildEnhancedEmptyState(  ) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor.withOpacity(0.15),
                  AppColors.primaryLight.withOpacity(0.08),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              size: 60,
              color: AppColors.primaryColor.withOpacity(0.7),
            ),
          ),
            SizedBox(height: 24),
          Text(
          LocaleKeys.Loads_no_loads_found.tr(),
            style:AppTextStyles.headlineSmall()

          ),
          const SizedBox(height: 12),
          Text(

            LocaleKeys.Loads_start_posting_first_load.tr(),


            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(16),

            ),
            child: ElevatedButton.icon(

              onPressed: (){},
              icon: const Icon(Icons.add_rounded),
              label: Text(LocaleKeys.Home_post_load.tr()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
