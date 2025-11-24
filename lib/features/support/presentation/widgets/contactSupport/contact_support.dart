import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import 'build_contact_widget.dart';

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
          SizedBox(
            width: AppConstants.w * 0.39,

            child: _buildSendProblemOption(context),
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
      iconColor: Colors.green,
      enabled: true,
      onTap: () {},
    );
  }

  // ---------------------------------------------------------
  Widget _buildChatOption() {
    return buildContactOption(
      title: LocaleKeys.Support_chat.tr(),
      subtitle: LocaleKeys.Support_online.tr(),

      icon: Icons.chat_outlined,
      iconColor: AppColors.primaryColor,
      enabled: true,
      onTap: () {},
    );
  }

  Widget _buildSendProblemOption(BuildContext context) {
    return buildContactOption(
      title: LocaleKeys.Problems_problem.tr(),
      subtitle: LocaleKeys.Problems_enterProblem.tr(),

      icon: Icons.report_problem_outlined,
      iconColor: Colors.red,
      enabled: true,
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.problems);
      },
    );
  }

  Widget _buildEmailOption() {
    return buildContactOption(
      title: LocaleKeys.Login_email.tr(),
      subtitle: LocaleKeys.Support_response24h.tr(),
      icon: Icons.email_outlined,
      iconColor: Colors.orange,
      enabled: true,
      onTap: () {},
    );
  }

  Widget _buildFaqOption() {
    return buildContactOption(
      title: LocaleKeys.Support_faq.tr(),
      subtitle: LocaleKeys.Support_selfHelp.tr(),
      icon: Icons.quiz_outlined,
      iconColor: Colors.purple,
      enabled: true,
      onTap: () {},
    );
  }

  Widget _buildSupportHours() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.schedule_outlined,
            color: AppColors.primaryColor,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              LocaleKeys.Support_supportHoursDescription.tr(),
              style: AppTextStyles.bodySmall().copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
}
