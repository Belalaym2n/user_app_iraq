import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
 import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/load_model.dart' show LoadModel;

class LoadHeader extends StatelessWidget {
  final LoadModel load;
  final ThemeData theme;
  final String Function(String key) tr;

  const LoadHeader({
    Key? key,
    required this.load,
    required this.theme,
    required this.tr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayId = load.id.length > 8
        ? load.id.substring(0, 8).toUpperCase()
        : load.id.toUpperCase();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LoadTitleRow(
                title: load.title,
                tr: tr,
              ),
              const SizedBox(height: 8),
              _LoadIdBadge(displayId: displayId),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _LoadPriceBadge(budget: load.budget),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////
///                 🔽 Sub Widgets Below 🔽                ///
///////////////////////////////////////////////////////////////

class _LoadTitleRow extends StatelessWidget {
  final String title;
  final String Function(String key) tr;

  const _LoadTitleRow({
    required this.title,
    required this.tr,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: AppConstants.w*0.23,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.errorColor,
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppColors.errorColor,
                    AppColors.errorColor.withOpacity(0.8),
                  ],
                ),
                 boxShadow: [
                  BoxShadow(
                    color:   AppColors.errorColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  const Icon(
                  Icons.bolt_rounded,
                  size: 12,
                  color: Colors.white,
                ),
                const SizedBox(width: 4), Text(
                  LocaleKeys.MyLoadsScreen_urgent.tr(),
                  style: AppTextStyles.labelLarge().copyWith(
                    color: Colors.white,
                  ),
                ),])
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadIdBadge extends StatelessWidget {
  final String displayId;

  const _LoadIdBadge({
    required this.displayId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(

        color: AppColors.primaryColor. withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:AppColors. primaryColor.withOpacity(0.2),
        ),
       ),
      child: Text(
        "Load #$displayId 23234".trim() ,
        style: AppTextStyles.bodyLarge().copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _LoadPriceBadge extends StatelessWidget {
  final double budget;

  const _LoadPriceBadge({
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.successColor.withOpacity(0.15),
              AppColors.successColor.withOpacity(0.08),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.successColor.withOpacity(0.3),
          ),
        ),
      child: Text(
        'د.ع ${budget.toStringAsFixed(0)}',
        style: AppTextStyles.bodyLarge().copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.successColor,
        ),
      ),
    );
  }
}
