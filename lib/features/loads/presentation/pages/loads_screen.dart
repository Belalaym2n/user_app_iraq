import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        CircularProgressIndicator,
        Scaffold,
        Colors,
        showDialog,
        Dialog,
        AppBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/features/loads/domain/use_cases/cancel_use_case.dart';
import 'package:user_app_iraq/features/loads/domain/use_cases/get_trip_use_case.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/screens/loads_screen_item.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../data/models/last_trip_model.dart';
import '../bloc/getTripsBloc/trips_bloc.dart';
import '../bloc/getTripsBloc/trips_events.dart';
import '../bloc/getTripsBloc/trips_status.dart';
import '../widgets/noLoads/no_loads_found.dart';

class LoadsScreen extends StatefulWidget {
  const LoadsScreen({super.key});

  @override
  State<LoadsScreen> createState() => _LoadsScreenState();
}

class _LoadsScreenState extends State<LoadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0, elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopScreenWidget(
              showIcons: false,
              text: LocaleKeys.Loads_my_loads.tr(),
            ),
            BlocProvider(
              create: (_) => TripsBloc(
                getIt<GetTripsUseCase>(),
                getIt<CancelTripUseCase>(),
              )..add(GetTripsEvent()),
              child: BlocConsumer<TripsBloc, TripsState>(
                listener: (context, state) {
                  if (state is TripsLoaded) {
                    if (state.isCancelling) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Dialog(
                          backgroundColor: Colors.transparent,
                          child: CustomLoadingWidget(),
                        ),
                      );
                    }

                    if (state.cancelSuccess) {
                      Navigator.of(context, rootNavigator: true).pop();
                      AppSnackBar.showSuccess(
                        context,
                        " LocaleKeys.MyLoadsScreen_cancelSuccess.tr()",
                      );
                    }

                    if (state.cancelError != null) {
                      Navigator.of(context, rootNavigator: true).pop();
                      AppSnackBar.showError(context, state.cancelError!);
                    }
                  }
                },

                builder: (context, state) {
                  if (state is TripsLoading) {
                    return get_trips_loading();
                  }

                  if (state is TripsLoaded) {
                    final trips = state.filteredTrips;
                    final selectedTab = state.selectedTab.index;


                    return LoadsScreenItem(
                      tripStatisticsModel: state.tripStatistics,
                      trips: trips,
                      selectedTab: state.selectedTab,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final fakeUser = UserProfileModel(
    id: 57,
    name: 'Belal Ahmed',
    email: 'belal@test.com',
    phone: '+201000000000',
    photoUrl: null,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    type: 'user',
    twoFactorEnabled: false,
    updatedAt: DateTime.now(),
  );

  final List<TripModel> fakeTrips = [
    TripModel(
      offers: [],

      id: 101,
      status: TripStatus.pending,
      pickupAddress: 'Nasr City, Cairo',
      pickupLat: 30.0561,
      pickupLng: 31.3300,
      destinationAddress: 'New Cairo',
      destinationLat: 30.0074,

      destinationLng: 31.4913,
      vehicleType: 'van',
      basePrice: 2500.0,
      scheduledAt: DateTime.now().add(const Duration(days: 1)),
      description: 'Furniture delivery',
      notes: 'Fragile items',
      user: UserProfileModel(
        id: 57,
        name: 'Belal Ahmed',
        email: 'belal@test.com',
        phone: '+201000000000',
        photoUrl: null,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        type: 'user',
        twoFactorEnabled: false,
        updatedAt: DateTime.now(),
      ),
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      updatedAt: DateTime.now(),
      tripTitle: '',
    ),

    /// 🟢 COMPLETED TRIP
    TripModel(
      tripTitle: '',
      offers: [],
      id: 102,
      status: TripStatus.pending,
      pickupAddress: 'Maadi, Cairo',
      pickupLat: 29.9602,
      pickupLng: 31.2569,
      destinationAddress: '6th of October',
      destinationLat: 29.9710,
      destinationLng: 30.9440,
      vehicleType: 'truck',
      basePrice: 4200.0,
      scheduledAt: DateTime.now().subtract(const Duration(days: 3)),
      description: 'Construction materials',
      notes: 'Delivered successfully',
      user: UserProfileModel(
        id: 57,
        name: 'Belal Ahmed',
        email: 'belal@test.com',
        phone: '+201000000000',
        photoUrl: null,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        type: 'user',
        twoFactorEnabled: false,
        updatedAt: DateTime.now(),
      ),
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  Widget get_trips_loading() {
    return Skeletonizer(
      enabled: true,
      child: LoadsScreenItem(
        tripStatisticsModel: TripStatisticsModel(
          totalTrips: 0,
          pendingTrips: 0,
          acceptedTrips: 0,
          startedTrips: 0,
          completedTrips: 0,
          cancelledTrips: 0,
        ),
        selectedTab: TripsTab.pending,
        trips: fakeTrips,
      ),
    );
  }
}
