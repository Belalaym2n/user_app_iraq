import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/top_screen_widget.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../call_widget/support_call_widget.dart';
import '../contactSupport/contact_support.dart';
import '../quick_help/buildQuickButtons/quick_help.dart';
import '../youtubeVideo/youtube_video.dart';

class SupportScreenItem extends StatefulWidget {
  const SupportScreenItem({super.key});

  @override
  State<SupportScreenItem> createState() => _SupportScreenItemState();
}

class _SupportScreenItemState extends State<SupportScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopScreenWidget(
              iconButton: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),

              screenIcon: Icons.support_agent,
              text: LocaleKeys.Support_supportAndHelp.tr(),
            ),

            SizedBox(height: AppConstants.h * 0.02),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: InstructionsVideo(),
            ),

            Column(children: [QuickHelp(), ContactSupport()]),
          ],
        ),
      ),
    );
  }
}
