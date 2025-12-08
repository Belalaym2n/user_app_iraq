import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../addLoad/presentation/widgets/basicInformation/build_vehicle.dart';
import '../../../data/models/bids_model.dart';
import '../../../data/models/bids_status_model.dart';
import '../../../data/models/driver_info.dart';
import '../../../data/models/load_model.dart' show LoadModel;
import '../../../data/models/load_states.dart';
import '../loadTypes/bids_section.dart';
import '../loadTypes/allLoadTypeScreen/load_item.dart';
import '../loadsStates/build_loads_states.dart';
import '../loadsTap/tabs_controller.dart';
import '../noLoads/no_loads_found.dart' show NoLoadsFound;

class LoadsScreenItem extends StatefulWidget {
  const LoadsScreenItem({super.key});

  @override
  State<LoadsScreenItem> createState() => _LoadsScreenItemState();
}

class _LoadsScreenItemState extends State<LoadsScreenItem> {
  final fakeLoad = LoadModel(
    id: "LOAD123",
    userId: "USER789",
    title: "Steel Beams Transport",
    pickupLocation: "Baghdad, Al-Mansour",
    deliveryLocation: "Basra, Industrial Area",
    weight: 12.5,
    // Tons
    dimensions: "6m x 1.5m x 1.2m",
    vehicleType: VehicleType.truck,
    budget: 350000,
    // IQD
    pickupDate: DateTime.now().add(const Duration(days: 1)),
    deliveryDate: DateTime.now().add(const Duration(days: 2)),
    status: LoadStatus.posted,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    bidsCount: 5,
    description: "Heavy steel beams requiring forklift at loading/unloading.",
    requirements: [
      "Forklift Required",
      "Experienced Driver",
      "Straps for securing load",
    ],
    contactPerson: "Ali Mohammed",
    contactPhone: "+9647700000000",
    isUrgent: true,
    distance: 545.0,
    // km
    pickupCoordinates: {"lat": 33.3128, "lng": 44.3615},
    deliveryCoordinates: {"lat": 30.5080, "lng": 47.7835},
    minBudget: 300000,
    maxBudget: 400000,
    specialInstructions: "Handle carefully, no sharp turns.",
    images: [
      "https://dummyimage.com/600x400/cccccc/000000.jpg",
      "https://dummyimage.com/500x300/bbbbbb/000000.jpg",
    ],
    isActive: true,
    viewCount: 143,
    assignedDriverId: null,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopScreenWidget(
              showIcons: false,
              text: LocaleKeys.Loads_my_loads.tr(),
            ),
            SizedBox(height: AppConstants.h * 0.02),
            BuildLoadsStates(),
            TabControllerItem(
              selectedIndex: 0,
              successOrder: 12,
              pendingOrder: 23,
              cancelOrder: 2,
            ),
            SizedBox(height: AppConstants.h * 0.01),
            EnhancedLoadCard(
              load: fakeLoad,
              // Fake Mode
              index: 0,
              // أو أي رقم
              theme: Theme.of(context),
              // مهم جداً
              onViewDetails: (load) {
                print("object");
                Navigator.pushNamed(context, AppRoutes.loadDetailsScreen);
              },
              tr: (key) => key, // لو لسه مش مركّب localization
            ),

            // NoLoadsFound(),
          ],
        ),
      ),
    );
  }
}
