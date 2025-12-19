import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../presentation/widgets/quick_help/appGuide/build_app_guide.dart';
// Data Model
class GuideStep {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final List<String> steps;

  GuideStep({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.steps,
  });
}


final List<GuideStep> guideSteps = [
  GuideStep(
    icon: Icons.add_location_alt,
    title: LocaleKeys.Support_guide_create_request_title.tr(),
    description: LocaleKeys.Support_guide_create_request_desc.tr(),
    color: AppColors.primaryColor,
    steps: [
      LocaleKeys.Support_guide_create_request_step1.tr(),
      LocaleKeys.Support_guide_create_request_step2.tr(),
      LocaleKeys.Support_guide_create_request_step3.tr(),
      LocaleKeys.Support_guide_create_request_step4.tr(),
      LocaleKeys.Support_guide_create_request_step5.tr(),
    ],
  ),
  GuideStep(
    icon: Icons.local_offer,
    title: LocaleKeys.Support_guide_receive_offers_title.tr(),
    description: LocaleKeys.Support_guide_receive_offers_desc.tr(),
    color: AppColors.successColor,
    steps: [
      LocaleKeys.Support_guide_receive_offers_step1.tr(),
      LocaleKeys.Support_guide_receive_offers_step2.tr(),
      LocaleKeys.Support_guide_receive_offers_step3.tr(),
      LocaleKeys.Support_guide_receive_offers_step4.tr(),
      LocaleKeys.Support_guide_receive_offers_step5.tr(),
    ],
  ),
  GuideStep(
    icon: Icons.location_on,
    title: LocaleKeys.Support_guide_track_delivery_title.tr(),
    description: LocaleKeys.Support_guide_track_delivery_desc.tr(),
    color: AppColors.infoColor,
    steps: [
      LocaleKeys.Support_guide_track_delivery_step1.tr(),
      LocaleKeys.Support_guide_track_delivery_step2.tr(),
      LocaleKeys.Support_guide_track_delivery_step3.tr(),
      LocaleKeys.Support_guide_track_delivery_step4.tr(),
      LocaleKeys.Support_guide_track_delivery_step5.tr(),
    ],
  ),
  GuideStep(
    icon: Icons.star,
    title: LocaleKeys.Support_guide_rate_review_title.tr(),
    description: LocaleKeys.Support_guide_rate_review_desc.tr(),
    color: AppColors.secondaryColor,
    steps: [
      LocaleKeys.Support_guide_rate_review_step1.tr(),
      LocaleKeys.Support_guide_rate_review_step2.tr(),
      LocaleKeys.Support_guide_rate_review_step3.tr(),
      LocaleKeys.Support_guide_rate_review_step4.tr(),
      LocaleKeys.Support_guide_rate_review_step5.tr(),
    ],
  ),
];
