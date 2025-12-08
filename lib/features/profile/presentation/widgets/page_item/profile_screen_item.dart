import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/sharedWidgets/top_screen_widget.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/profile/data/models/profile_model.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/profileButtons/profile_buttons.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/quick_actions.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../build_main_menue.dart';
import '../pageWidgets/build_profile_header.dart';
import '../build_state_card.dart';

class ProfileScreenItem extends StatefulWidget {
    ProfileScreenItem({super.key,required this.profileModel});

    UserProfileModel profileModel;
  @override
  State<ProfileScreenItem> createState() => _ProfileScreenItemState();
}

class _ProfileScreenItemState extends State<ProfileScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
      ),

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: AppConstants.h * 0.32,
            pinned: true,
            backgroundColor: AppColors.primaryColor,

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final maxHeight = AppConstants.h * 0.32;
                final collapseValue = constraints.maxHeight / maxHeight;

                final showTitle = collapseValue < 0.60; // يظهر عند الانهيار

                return FlexibleSpaceBar(
                  centerTitle: true,

                  title: showTitle
                      ? Text(
                    "Profile",
                    style: AppTextStyles.headlineLarge().copyWith(
                      color: Colors.white,
                      fontSize: AppConstants.w * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : null,

                  background: buildProfileHeader(

                      user: widget.profileModel),
                );
              },
            ),
          ),

          /// -------------------------------
          /// SCREEN BODY CONTENT
          /// -------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.w * 0.04, // بدل 16
                vertical: AppConstants.h * 0.02,   // بدل 16
              ),
              child: Column(
                children: [
                  /// CARD
                  BuildStateCard(),
                  SizedBox(height: AppConstants.h * 0.025), // بدل 20

                  /// MENU
                  BuildMainMenu(),
                  SizedBox(height: AppConstants.h * 0.025), // بدل 20

                  /// QUICK ACTIONS
                  BuildQuickActions(),
                  SizedBox(height: AppConstants.h * 0.04), // بدل 32

                  /// BUTTONS
                  ProfileButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
