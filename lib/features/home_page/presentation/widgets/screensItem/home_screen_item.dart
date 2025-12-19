import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:user_app_iraq/features/home_page/presentation/widgets/widgets/quickActions/build_quick_actions.dart';

import '../../../../../core/utils/app_colors.dart';
import '../widgets/floatingActionButton/floating_action_button.dart';
import '../widgets/home_page_header.dart';


class HomeScreenItem extends StatefulWidget {
  const HomeScreenItem({super.key});

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MobileHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: BuildQuickActions()),

          // SliverToBoxAdapter(child: ActiveShipmentsSection()),
          // const SliverToBoxAdapter(child: SizedBox(height:0)),
          //
          // SliverToBoxAdapter(child: EmptyShipmentsWidget()),
          //
          // SliverToBoxAdapter(child: JourneysEmpty()),
          //   SliverToBoxAdapter(child: SizedBox(height:AppConstants.h*0.15)),

        ],
      ),
      floatingActionButton: EnhancedFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
