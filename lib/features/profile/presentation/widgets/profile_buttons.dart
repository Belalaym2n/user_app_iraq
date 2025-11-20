import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart'; // لو بتستخدم GetX
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../core/utils/app_colors.dart';


class ProfileButtons extends StatefulWidget {
  const ProfileButtons({super.key});

  @override
  State<ProfileButtons> createState() => _ProfileButtonsState();
}

class _ProfileButtonsState extends State<ProfileButtons> {
  // Controller placeholder — استبدله بالكونترولر الحقيقي
  final controller = _FakeController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildAccountActions(context,      ),
    );
  }

  /// ------------------------------
  /// ACCOUNT ACTIONS UI
  /// ------------------------------
  Widget _buildAccountActions(
      BuildContext context,

      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// LOGOUT BUTTON
        OutlinedButton.icon(
          onPressed: controller.logout,
          icon: Icon(Icons.logout, color: AppColors.textPrimary),
          label: Text(LocaleKeys.Profile_logout.tr),
         style: ButtonStyle(

         ),
        ),

        const SizedBox(height: 12),

        /// DELETE ACCOUNT BUTTON
        TextButton.icon(
          onPressed: () => _showDeleteAccountDialog(context),
          icon: Icon(Icons.delete_outline, color: AppColors.errorColor),
          label: Text(
            LocaleKeys.Profile_delete_account.tr,
            style: TextStyle(color: AppColors.errorColor),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }

  /// ------------------------------
  /// DELETE ACCOUNT DIALOG
  /// ------------------------------
  Future<void> _showDeleteAccountDialog(
      BuildContext context,    ) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          LocaleKeys.Profile_delete_account.tr,
          style: TextStyle(color: AppColors.errorColor, fontWeight: FontWeight.bold),
        ),
        content: Text("Are your sure to delete acc"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(LocaleKeys.Profile_Cancel.tr),
          ),
          TextButton(
            onPressed: () {
              controller.deleteAccount();
              Get.back();
            },
            child: Text(
              LocaleKeys.Profile_delete_account.tr,
              style: TextStyle(color: AppColors.errorColor),
            ),
          ),
        ],
      ),
    );
  }
}

/// ----------------------------
/// FAKE CONTROLLER FOR SAMPLE
/// ----------------------------
class _FakeController {
  void logout() {
    print("LOGOUT PRESSED");
  }

  void deleteAccount() {
    print("DELETE ACCOUNT PRESSED");
  }
}
