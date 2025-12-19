import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import 'action_button.dart';

class EditableInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextInputType? keyboardType;

  const EditableInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.controller,
    required this.isEditing,
    required this.onEdit,
    required this.onSave,
    required this.onCancel,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isEditing
            ? color.withOpacity(0.05)
            : AppColors.neutralGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isEditing
              ? color
              : AppColors.borderColor,
          width: isEditing ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: isEditing
                ? _buildEditingField()
                : _buildDisplayField(),
          ),
          const SizedBox(width: 8),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildDisplayField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodySmall().copyWith(
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          controller.text.isEmpty ? 'غير محدد' : controller.text,
          style: AppTextStyles.headlineSmall(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildEditingField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodySmall().copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          autofocus: true,
          keyboardType: keyboardType,
          style: AppTextStyles.headlineSmall(),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 0,
            ),
            border: InputBorder.none,
            hintText: 'أدخل $title',
            hintStyle: AppTextStyles.bodyMedium().copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    if (isEditing) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ActionButton(
            icon: Icons.close_rounded,
            color: AppColors.errorColor,
            onTap: onCancel,
          ),
          const SizedBox(width: 8),
          ActionButton(
            icon: Icons.check_rounded,
            color: AppColors.successColor,
            onTap: onSave,
          ),
        ],
      );
    }

    return ActionButton(
      icon: Icons.edit_outlined,
      color: color,
      onTap: onEdit,
    );
  }
}
