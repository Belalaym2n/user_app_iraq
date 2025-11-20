import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/home_page/presentation/widgets/widgets/quickActions/build_quick_actions.dart';

import '../widgets/floatingActionButton/floating_action_button.dart';
import '../widgets/home_page_header.dart';
import '../widgets/journey/journeys_empty.dart';
import '../widgets/userActive/build_user_active.dart';
import '../widgets/userActive/emty_shipments.dart';

class HomeScreenItem extends StatefulWidget {
  const HomeScreenItem({super.key});

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: MobileHeader(width: AppConstants.w, height: AppConstants.h),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: BuildQuickActions()),
          SliverToBoxAdapter(child: ActiveShipmentsSection()),
          SliverToBoxAdapter(child: EmptyShipmentsWidget()),
          SliverToBoxAdapter(child: JourneysEmpty()),
        ],

      ),
      floatingActionButton:
      EnhancedFloatingActionButton(  ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
