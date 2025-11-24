import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';

import '../../../../../generated/locale_keys.g.dart';

class SupportCallWidget extends StatelessWidget {
  const SupportCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEmergencySection(context);
  }

  Widget _buildEmergencySection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _build_support_call(),
              const SizedBox(width: 16),
              _build_support_text()

            ],
          ),

          const SizedBox(height: 16),

          _build_call_button()
        ],
      ),
    );
  }

  Widget _build_call_button(){
    return    SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.call, size: 20),
        label: Text(
          LocaleKeys.Support_callNow.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
 Widget _build_support_text(){
    return    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.Support_emergencySupport.tr(),
            style: AppTextStyles.titleMedium().copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            LocaleKeys.Support_emergencyHelpDescription.tr(),
            style: AppTextStyles.bodyMedium().copyWith(
              color: Colors.red.shade600,
            ),
          ),
        ],
      ),
    );
  }
  Widget  _build_support_call(){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.support_agent,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
