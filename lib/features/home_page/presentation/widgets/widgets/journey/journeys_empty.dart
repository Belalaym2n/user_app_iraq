import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class JourneysEmpty extends StatefulWidget {
    JourneysEmpty({super.key});

  @override
  State<JourneysEmpty> createState() => _JourneysEmptyState();
}

class _JourneysEmptyState extends State<JourneysEmpty> {
  @override
  Widget build(BuildContext context) {
    return _buildEmptyState(context);
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(
        //   color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        // ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.local_shipping_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          _build_no_journey_yet(),
          const SizedBox(height: 8),
        _build_no_journey_description(),
          const SizedBox(height: 24),
          _build_create_button()
        ],
      ),
    );
  }

  Widget _build_create_button(){
    return  ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text('Create Load'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(12))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
  Widget _build_no_journey_yet() {
    return Text(
      LocaleKeys.Home_no_journey_yet.tr(),

      style: AppTextStyles.titleLarge(),
    );
  }

  Widget _build_no_journey_description(){
    return   Text(

      LocaleKeys.Home_start_journey.tr(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }
}
