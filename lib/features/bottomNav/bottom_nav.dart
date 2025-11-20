import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:user_app_iraq/features/login/presentation/widgets/login_screen_item.dart';
import 'package:user_app_iraq/features/profile/presentation/pages/profile_screen.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_constants.dart';
import '../../generated/locale_keys.g.dart';
import '../home_page/presentation/pages/home_page.dart';
import '../loads/presentation/pages/loads_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  List<Widget> pages = [HomePage(),LoadsScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              // Soft shadow for a sleek effect
              blurRadius: 15,
              offset: Offset(3, 3), // Slightly adjusted shadow direction
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          // More subtle rounded corners
          color: Colors.white, // Background color to maintain clarity
        ),
        child: GNav(
          style: GnavStyle.google,

          onTabChange: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          haptic: true,
          tabBorderRadius: AppConstants.w * 0.03,
          backgroundColor: AppColors.primaryColor,
          // Keep the brand's primary color
          tabActiveBorder: Border.all(color: Colors.white, width: 2),
          // Border on active tab
          curve: Curves.easeInOut,
          // Smoother, more subtle transition effect
          duration: const Duration(milliseconds: 700),
          // Faster transition for responsiveness
          gap: 12,
          // Slightly more space between tabs for cleaner layout
          color: Colors.white,
          // Color for inactive tabs
          activeColor: Colors.black,
          // Dark color for active tabs to stand out
          iconSize: AppConstants.w * 0.065,
          // Adjust icon size for better visibility
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.white,
          // Soft background for active tab
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w * 0.05,
            vertical: AppConstants.h * 0.000, // More padding for better balance
          ),
          tabs: [
            GButton(
              margin: EdgeInsets.symmetric(
                horizontal: AppConstants.w * 0.02,

                vertical: AppConstants.h * 0.02,
              ),
              icon: Icons.home_outlined, // Home icon
              text: 'Home',
              iconColor: Colors.white, // Icon color to match the theme
            ),

            GButton(
              margin: EdgeInsets.symmetric(
                horizontal: AppConstants.w * 0.04,

                vertical: AppConstants.h * 0.02,
              ),
              icon: Icons.credit_card_outlined, // Notification icon
              text: LocaleKeys.Loads_my_loads.tr(),
              iconColor: Colors.white, // Cool tone for notifications
            ),

            GButton(
              margin: EdgeInsets.symmetric(
                horizontal: AppConstants.w * 0.04,

                vertical: AppConstants.h * 0.02,
              ),
              icon: Icons.notifications, // Notification icon
              text: "Profile",
              iconColor: Colors.white, // Cool tone for notifications
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
