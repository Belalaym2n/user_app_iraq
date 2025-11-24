import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/buttons.dart';
import 'package:user_app_iraq/core/sharedWidgets/top_screen_widget.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../basicInformation/build_basic_information.dart';
import '../buildBudegetWidget/build_budget_widget.dart';
import '../loads_widgets/add_load_headline.dart';
import '../pickUpAndDelivery/pickup_and_delivery.dart';
import '../sheduling/sheduling_widget.dart';

class LoadsItem extends StatefulWidget {
  const LoadsItem({super.key});

  @override
  State<LoadsItem> createState() => _LoadsItemState();
}

class _LoadsItemState extends State<LoadsItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryColor,
          toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopScreenWidget(
              screenIcon: Icons.local_shipping_outlined,

              iconButton: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  weight: AppConstants.w * 0.03,
                ),
              ),
              text: LocaleKeys.Home_post_load.tr(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: AppConstants.h * 0.02),
                  AddLoadHeadline(),
                  SizedBox(height: AppConstants.h * 0.02),

                  BuildBasicInformation(),
                  SizedBox(height: AppConstants.h * 0.02),

                  PickupAndDelivery(),
                  SizedBox(height: AppConstants.h * 0.02),

                  SchedulingWidget(),
                  SizedBox(height: AppConstants.h * 0.02),

                  BuildBudgetWidget(),
                  SizedBox(height: AppConstants.h * 0.02),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: large_button(
                      onPressed: () {},
                      buttonName: LocaleKeys.Home_post_load.tr(),
                    ),
                  ),
                  SizedBox(height: AppConstants.h * 0.02),
                  SizedBox(height: AppConstants.h * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
