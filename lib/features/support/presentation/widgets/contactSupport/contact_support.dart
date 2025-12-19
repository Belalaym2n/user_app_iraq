import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/support/data/models/url_lanch_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import 'build_contact_widget.dart';
import 'buildFAQ/build_faq.dart';

class ContactSupport extends StatefulWidget {
  ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return _buildContactSection();
  }

  Widget _buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            LocaleKeys.Support_contactSupport.tr(),
            style: AppTextStyles.titleMedium().copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(height: 20),

          // ----------- Contact Options Row 1 -----------
          Row(
            children: [
              Expanded(child: _buildCallOption()),
              const SizedBox(width: 12),
              Expanded(child: _buildChatOption()),

              // Expanded(child: _buildChatOption()),
            ],
          ),

          const SizedBox(height: 12),

          // ----------- Contact Options Row 2 -----------
          Row(
            children: [
              Expanded(child: _buildEmailOption()),
              const SizedBox(width: 12),
              Expanded(child: _buildFaqOption()),
            ],
          ),

          const SizedBox(height: 20),

          // ----------- Support Hours -----------
          _buildSupportHours(),
        ],
      ),
    );
  }

  // ---------------------------------------------------------

  Widget _buildCallOption() {
    return buildContactOption(
      title: LocaleKeys.Support_callNow.tr(),
      subtitle: LocaleKeys.Support_availableNow.tr(),
      icon: Icons.phone_outlined,
      iconColor: const Color(0xFFEF4444), // Professional red
      enabled: true,
      onTap: () {        UrlLaunchModel.makePhoneCall("phoneNumber");
      },
    );
  }

  Widget _buildChatOption() {
    return buildContactOption(
      title: LocaleKeys.Support_chat.tr(),
      subtitle: LocaleKeys.Support_liveChatDescription.tr(),
      icon: Icons.chat_bubble_outline_rounded,
      iconColor: const Color(0xFF10B981), // Professional green
      enabled: true,
      onTap: () {
        UrlLaunchModel.openWhatsApp("phoneNumber");
      },
    );
  }

  Widget _buildEmailOption() {
    return buildContactOption(
      title: LocaleKeys.Login_email.tr(),
      subtitle: LocaleKeys.Support_response24h.tr(),
      icon: Icons.email_outlined,
      iconColor: const Color(0xFFF59E0B), // Professional orange
      enabled: true,
      onTap: () {
        UrlLaunchModel.sendEmail("phoneNumber");

      },
    );
  }

  Widget _buildFaqOption() {
    return buildContactOption(
      title: LocaleKeys.Support_faq.tr(),
      subtitle: LocaleKeys.Support_selfHelp.tr(),
      icon: Icons.help_outline_rounded,
      iconColor: const Color(0xFF8B5CF6), // Professional purple
      enabled: true,
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => const FaqDialog(),
        );
      },
    );
  }

  Widget _buildSupportHours() {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
         color: AppColors.infoColor.withOpacity(0.06),

        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.access_time_rounded,
              color: AppColors.primaryColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              LocaleKeys.Support_supportHoursDescription.tr(),
              style: AppTextStyles.bodySmall().copyWith(
                color: AppColors.textPrimary,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
}
