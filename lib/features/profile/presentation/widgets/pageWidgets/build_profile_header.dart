import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/profile/data/models/profile_model.dart';

Widget buildProfileHeader({
  required UserProfileModel user
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    decoration: BoxDecoration(
      color:        AppColors.backgroundColor,
       boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        _buildProfileAvatar(),
        const SizedBox(height: 14),
        _buildUserName(user.name.toString()),
        const SizedBox(height: 4),
        _buildEmail(user.email),
        const SizedBox(height: 14),
        _buildStatusTag(),
      ],
    ),
  );
}

Widget _buildProfileAvatar() {
  return Stack(
    alignment: Alignment.center,
    children: [_buildAvatarGlow(), _buildAvatarCircle(), _buildCameraButton()],
  );
}

/// Soft Glow Circle
Widget _buildAvatarGlow() {
  return Container(
    width: 105,
    height: 105,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          AppColors.primaryColor.withOpacity(0.25),
          AppColors.primaryColor.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );
}

Widget _buildAvatarCircle() {
  return CircleAvatar(
    radius: 48,
    backgroundColor: Colors.white,
    child: CircleAvatar(
      radius: 44,
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      child: Icon(Icons.person, size: 48, color: AppColors.primaryColor),
    ),
  );
}

Widget _buildCameraButton() {
  return Positioned(
    bottom: 6,
    right: 6,
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Icon(Icons.camera_alt, size: 15, color: Colors.white),
    ),
  );
}

Widget _buildUserName(String name) {
  return Text(
    name,
    style: AppTextStyles.headlineMedium().copyWith(
      fontWeight: FontWeight.w900,
      color: AppColors.textPrimary,
    ),
  );
}

/// -----------------------------------------------------------
/// 🔵 Email
/// -----------------------------------------------------------
Widget _buildEmail(String email) {
  return Text(
email,
    style: AppTextStyles.bodyMedium().copyWith(color: AppColors.textSecondary),
  );
}

Widget _buildStatusTag() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.verified, size: 16, color: AppColors.primaryColor),
        const SizedBox(width: 6),
        Text(
          "Verified Account",
          style: AppTextStyles.bodySmall().copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
