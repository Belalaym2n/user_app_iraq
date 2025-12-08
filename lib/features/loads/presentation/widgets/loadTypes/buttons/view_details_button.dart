import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';

class ViewDetailsButton extends StatefulWidget {
  const ViewDetailsButton({super.key});

  @override
  State<ViewDetailsButton> createState() => _ViewDetailsButtonState();
}

class _ViewDetailsButtonState extends State<ViewDetailsButton> {
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
    Expanded(
    child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
    border: Border.all(
    color: AppColors.primaryColor.withOpacity(0.2),
    ),
    ),
    child: OutlinedButton.icon(
    onPressed: () {
    },
    icon: const Icon(Icons.visibility_rounded, size: 16),
    label: Text(LocaleKeys.MyLoadsScreen_viewDetails.tr()),
    style: OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(vertical: 12),
    side: BorderSide.none,
    foregroundColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    ),
    ))]);

  }
}
