import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/support/presentation/widgets/contactSupport/buildFAQ/build_faq_tabs.dart';

import '../../../../data/models/build_faq_questions.dart';
import 'build_faq_header.dart';

class FaqDialog extends StatefulWidget {
  const FaqDialog({super.key});

  @override
  State<FaqDialog> createState() => _FaqDialogState();
}

class _FaqDialogState extends State<FaqDialog>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.055, // 20 / 360
        vertical: AppConstants.h * 0.038,  // 30 / 776
      ),
      child: Container(
        height: AppConstants.h * 0.8, // 80%
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(
            AppConstants.w * 0.077, // 28 / 360
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.15),
              blurRadius: AppConstants.w * 0.083, // 30 / 360
              offset: Offset(
                0,
                AppConstants.h * 0.019, // 15 / 776
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            buildFAQHeader(context),
            _buildSearchBar(),
            Expanded(
              child: BuildFaqTabs(
                searchQuery: _searchQuery,
                searchController: _searchController,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(
        AppConstants.w * 0.044, // 16 / 360
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutralGray,
          borderRadius: BorderRadius.circular(
            AppConstants.w * 0.033, // 12 / 360
          ),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          style: TextStyle(
            fontSize: AppConstants.w * 0.041, // 15 / 360
          ),
          decoration: InputDecoration(
            hintText: 'Search for questions...',
            hintStyle: TextStyle(color: AppColors.textMuted),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.textSecondary,
              size: AppConstants.w * 0.066, // 24 / 360
            ),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
              icon: Icon(
                Icons.clear,
                color: AppColors.textSecondary,
                size: AppConstants.w * 0.061, // 22 / 360
              ),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchQuery = '';
                });
              },
            )
                : null,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppConstants.w * 0.044, // 16 / 360
              vertical: AppConstants.h * 0.018,  // 14 / 776
            ),
          ),
        ),
      ),
    );
  }
}
