import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:user_app_iraq/features/profile/presentation/bloc/profile_event.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.w * 0.04), // 16
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// LOGOUT BUTTON
          _buildButton(
            context,
            icon: Icons.logout,
            label: LocaleKeys.Profile_logout.tr(),
            color: AppColors.textPrimary,
            onTap: () => _showConfirmationDialog(
              context,
              title: LocaleKeys.Profile_logout.tr(),
              message: "Are you sure you want to logout?",
              confirmText: LocaleKeys.Profile_logout.tr(),
              confirmColor: AppColors.textPrimary,
              onConfirm: () {
                context.read<ProfileBloc>().add(LogoutEvent());
                Navigator.pop(context);
              },
            ),
          ),

          SizedBox(height: AppConstants.h * 0.015), // 12

          /// DELETE ACCOUNT BUTTON
          _buildButton(
            context,
            icon: Icons.delete_outline,
            label: LocaleKeys.Profile_delete_account.tr(),
            color: AppColors.errorColor,
            onTap: () => _showConfirmationDialog(
              context,
              title: LocaleKeys.Profile_delete_account.tr(),
              message: "Are you sure you want to delete your account?",
              confirmText: LocaleKeys.Profile_delete_account.tr(),
              confirmColor: AppColors.errorColor,
              onConfirm: () {
                print("DELETE ACCOUNT");
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------------------
  // REUSABLE BUTTON WIDGET
  // ------------------------------------------------------------------------
  Widget _buildButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required Color color,
        required VoidCallback onTap,
      }) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: color,
        size: AppConstants.w * 0.06, // iconSize ~ 24
      ),
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: AppConstants.w * 0.04, // ~16
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.h * 0.02, // 16
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.03), // 12
          side: BorderSide(color: color.withOpacity(0.4)),
        ),
      ),
    );
  }

  // ------------------------------------------------------------------------
  // REUSABLE CONFIRMATION DIALOG
  // ------------------------------------------------------------------------
  Future<void> _showConfirmationDialog(
      BuildContext context, {
        required String title,
        required String message,
        required String confirmText,
        required VoidCallback onConfirm,
        required Color confirmColor,
      }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.w * 0.04), // 16
        ),
        title: Text(
          title,
          style: TextStyle(
            color: confirmColor,
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.w * 0.045, // ~18
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            fontSize: AppConstants.w * 0.04, // ~16
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              LocaleKeys.Profile_Cancel.tr(),
              style: TextStyle(fontSize: AppConstants.w * 0.04),
            ),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              confirmText,
              style: TextStyle(
                color: confirmColor,
                fontSize: AppConstants.w * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
