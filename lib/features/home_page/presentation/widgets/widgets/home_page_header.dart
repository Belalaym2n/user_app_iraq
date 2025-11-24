import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/sharedWidgets/animation_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../bottomNav/bottom_nav.dart';
import 'build_icon.dart';

// NEW

class MobileHeader extends StatefulWidget {
  final Duration duration;
  final Curve curve;

  const MobileHeader({
    super.key,
    this.duration = const Duration(milliseconds: 700),
    this.curve = Curves.easeOutBack,
  });

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SlideAnimator _anim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _anim = SlideAnimator(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// ============================================
  /// 🔥 animationDoSlide (مثل الطريقة اللي بتحبها)
  /// ============================================
  Widget animationDoSlide({
    required int index,
    required int delay,
    required Widget child,
  }) {
    late Animation<Offset> animation;

    if (index == 1) {
      animation = _anim.fromLeft; // من الشمال
    } else if (index == 2) {
      animation = _anim.fromRight; // من اليمين
    } else {
      animation = _anim.fromBottom; // من تحت
    }

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: delay + 400),
      builder: (context, value, _) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: animation.value * (1 - value) * 80,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return AnimatedContainer(
      height: AppConstants.h * 0.2,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,

      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.05,
        vertical: AppConstants.h * 0.02,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppConstants.w * 0.1),
          bottomLeft: Radius.circular(AppConstants.w * 0.1),
        ),
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: AppConstants.w * 0.027,
            offset: Offset(0, AppConstants.h * 0.005),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.h * 0.01),

          _buildHeader(context),

          SizedBox(height: AppConstants.h * 0.02),

          /// 🔥 الشركة (من الشمال)
          animationDoSlide(
            index: 1,
            delay: 450,
            child: _buildCompanyBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        /// 🔥 النصوص (من الشمال)
        animationDoSlide(
          index: 1,
          delay: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeUser(),
              SizedBox(height: AppConstants.h * 0.005),
              _manageText(),
            ],
          ),
        ),

        SizedBox(width: AppConstants.w * 0.02),
        const Spacer(),

        /// 🔥 الإشعارات (من اليمين)
        animationDoSlide(
          index: 2,
          delay: 250,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.notification),
            child: _buildNotificationIcon(),
          ),
        ),

        SizedBox(width: AppConstants.w * 0.02),

        /// 🔥 البروفايل (من اليمين)
        animationDoSlide(
          index: 2,
          delay: 350,
          child: _buildProfileButton(context),
        ),
      ],
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BottomNav(initialIndex: 2)),
      ),
      borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
      child: _iconContainer(
        color: Colors.white,
        borderColor: Colors.grey.shade300,
        child: FaIcon(
          FontAwesomeIcons.user,
          color: AppColors.primaryColor,
          size: AppConstants.w * 0.055,
        ),
      ),
    );
  }

  Widget _iconContainer({
    required Widget child,
    required Color color,
    required Color borderColor,
  }) {
    return Container(
      width: AppConstants.w * 0.13,
      height: AppConstants.w * 0.13,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppConstants.w * 0.033),
        border: Border.all(
          color: borderColor,
          width: AppConstants.w * 0.003,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: AppConstants.w * 0.005,
            blurRadius: AppConstants.w * 0.011,
            offset: Offset(0, AppConstants.h * 0.0025),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }

  Widget _buildCompanyBox() {
    return Container(
      height: AppConstants.h * 0.06,
      width: AppConstants.w * 0.9,
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.h * 0.015,
        horizontal: AppConstants.w * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.w * 0.035),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: AppConstants.w * 0.022,
            offset: Offset(0, AppConstants.h * 0.005),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildIcon(iconData: Icons.local_shipping),
          SizedBox(width: AppConstants.w * 0.02),
          _companyName(),
        ],
      ),
    );
  }

  Widget _manageText() {
    return Text(
      LocaleKeys.Home_manage_freight.tr(),
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: AppConstants.w * 0.036,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildNotificationIcon() {
    return _iconContainer(
      color: Colors.transparent,
      borderColor: Colors.grey.shade300,
      child: Icon(
        Icons.notifications,
        color: Colors.white,
        size: AppConstants.w * 0.055,
      ),
    );
  }

  Widget _welcomeUser() {
    return Text(
      "${LocaleKeys.Home_welcome.tr()}, User",
      style: TextStyle(
        color: Colors.white,
        fontSize: AppConstants.w * 0.05,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _companyName() {
    return Text(
      'FreightX',
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: AppConstants.w * 0.061,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
    );
  }
}
