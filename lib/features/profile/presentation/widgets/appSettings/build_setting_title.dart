import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';

class SettingTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingTitle({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildLeadingIcon(),
      title: _buildTitle(),
      subtitle: subtitle != null ? _buildSubtitle() : null,
      trailing: _buildTrailing(),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: AppColors.primaryColor,
        size: 20,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTextStyles.headlineSmall(),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      subtitle!,
      style: AppTextStyles.bodySmall(),
    );
  }

  Widget? _buildTrailing() {
    if (trailing != null) return trailing;

    if (onTap != null) {
      return Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: AppColors.textMuted,
      );
    }

    return null;
  }
}
