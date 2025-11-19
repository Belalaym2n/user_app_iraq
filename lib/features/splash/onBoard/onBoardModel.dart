import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class OnBoardModel {
  final IconData icon;
  String headline;
  String description;

  OnBoardModel({
    required this.icon,
    required this.headline,
    required this.description,
  });

  static List<OnBoardModel> items = [
    OnBoardModel(
      icon: Icons.star,
      headline: LocaleKeys.onboard_1_welcome_message.tr(),
      description: LocaleKeys.onboard_1_onboardingDesc1.tr(),
    ),
    OnBoardModel(
      icon: Icons.touch_app,
      headline: LocaleKeys.onboard_2_onboardingTitle2.tr(),
      description: LocaleKeys.onboard_2_onboardingDesc2.tr(),
    ),
    OnBoardModel(
      icon: Icons.connect_without_contact,
      headline: LocaleKeys.onboard_3_onboardingTitle3.tr(),
      description: LocaleKeys.onboard_3_onboardingDesc3.tr(),
    ),
  ];
}
