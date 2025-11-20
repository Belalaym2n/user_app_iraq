import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../generated/locale_keys.g.dart';
class ActionItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String action;
  final Color color;

  ActionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.action,
    required this.color,
  });
}

final List<ActionItem> actions = [
  ActionItem(
    icon: Icons.add_box_rounded,
    title: LocaleKeys.Home_post_load.tr(),
    subtitle: LocaleKeys.Home_create_new_shipment.tr(),
    action: 'post_load',
    color: AppColors.primaryColor,
  ),
  ActionItem(
    icon: Icons.track_changes_rounded,
    title: LocaleKeys.Home_track.tr(),
    subtitle: LocaleKeys.Home_active_shipments_info.tr(),
    action: 'track_shipment',
    color: Colors.orange,
  ),
  ActionItem(
    icon: Icons.gavel_rounded,
    title: LocaleKeys.Home_bidding.tr(),
    subtitle: LocaleKeys.Home_view_live_auctions.tr(),
    action: 'bidding',
    color: Colors.orange,
  ),
  ActionItem(
    icon: Icons.support_agent_rounded,
    title: LocaleKeys.Home_support.tr(),
    subtitle: LocaleKeys.Home_assist_247.tr(),
    action: 'support',
    color: AppColors.primaryColor,
  ),
];
