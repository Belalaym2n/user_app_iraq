import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
  import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import 'build_icon.dart';

///------------------------------
///   Mobile Header Widget
///------------------------------
class MobileHeader extends StatefulWidget {
  final double width;
  final double height;
  final bool isMobile;

  const MobileHeader({
    super.key,
    required this.width,
    required this.height,
    this.isMobile = false,
  });

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader>
    with SingleTickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    final double width = widget.width;
    final double height = widget.height;

    return AnimatedContainer(
      height: height * 0.18 ,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.07,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppConstants.w*0.1),
          bottomLeft: Radius.circular(AppConstants.w*0.1)
        ),
        color: AppColors.primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.h * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Drawer Button Animation
              BuildIcon(iconData: Icons.local_shipping),
              SizedBox(width: AppConstants.w * 0.02),

              _build_company_name(),
              SizedBox(width: AppConstants.w * 0.02),

              // Notification Animation
              const Spacer(),

              // Welcome Animation
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notification);
                  },
                  child: BuildIcon(iconData: Icons.notifications)),
            ],
          ),
          SizedBox(height: AppConstants.h * 0.02),

          _welcome_user(),
          _manage_text()
        ],
      ),
    );
  }

  //==============================================================
  // Components
  //==============================================================
}
Widget _manage_text(){
  return      Text(
    LocaleKeys.Home_manage_freight.tr(),
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
      fontSize: 13, // Reduced from 15
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
    ),
    maxLines: 1, // Ensure single line
    overflow: TextOverflow.ellipsis,
  );
}
Widget _welcome_user(){
  return Text(
  "${   LocaleKeys.Home_welcome.tr()}, User",
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18, // Reduced from 20
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
    ),
    maxLines: 1, // Ensure single line
    overflow: TextOverflow.ellipsis,
  );
}
Widget _build_company_name() {
  return Text(
    'FreightX',
    style: TextStyle(
      color: Colors.white,
      fontSize: 22, // Reduced from 24
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),
  );
}


