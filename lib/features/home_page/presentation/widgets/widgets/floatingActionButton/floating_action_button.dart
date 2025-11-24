import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class EnhancedFloatingActionButton extends StatefulWidget {

  const EnhancedFloatingActionButton({
    Key? key,
   }) : super(key: key);

  @override
  State<EnhancedFloatingActionButton> createState() =>
      _EnhancedFloatingActionButtonState();
}

class _EnhancedFloatingActionButtonState
    extends State<EnhancedFloatingActionButton>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.add_load);
            },
            backgroundColor: AppColors.primaryColor,
            icon: const Icon(Icons.add_rounded, color: Colors.white),
            label: Text(
            LocaleKeys.Home_post_load.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )

    );
  }
}
