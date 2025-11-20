import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../loadsStates/build_loads_states.dart';
import '../noLoads/no_loads_found.dart' show NoLoadsFound;

class LoadsScreenItem extends StatefulWidget {
  const LoadsScreenItem({super.key});

  @override
  State<LoadsScreenItem> createState() => _LoadsScreenItemState();
}

class _LoadsScreenItemState extends State<LoadsScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopScreenWidget(text: LocaleKeys.Loads_my_loads.tr()),
          SizedBox(
            height: AppConstants.h*0.02,
          ),
          BuildLoadsStates(),
          SizedBox(
            height: AppConstants.h*0.01,
          ),
          NoLoadsFound(),
        ],
      ),
    );
  }
}
