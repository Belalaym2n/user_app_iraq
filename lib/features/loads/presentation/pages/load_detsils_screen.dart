import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/features/loads/data/models/last_trip_model.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/domain/use_cases/accept_trip_use_case.dart';
import 'package:user_app_iraq/features/loads/domain/use_cases/get_trip_details.dart';
import 'package:user_app_iraq/features/loads/presentation/bloc/get_trip_details/get_trip_details_states.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/screens/load_detailed_screen_item.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../data/models/offers_model.dart';
import '../bloc/get_trip_details/get_trip_details_bloc.dart';
import '../bloc/get_trip_details/get_trip_details_event.dart';

class LoadDetailsScreen extends StatelessWidget {
  LoadDetailsScreen({super.key, required this.tripModel});

  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    OfferModel? getAcceptedOffer(List<OfferModel> offers) {
      try {
        return offers.firstWhere(
              (o) => o.status == OfferStatus.accepted,
        );
      } catch (_) {
        return null;
      }
    }

    return BlocProvider(
      create: (_) =>
          TripDetailsBloc(getIt<GetTripDetailsUseCase>(),getIt<AcceptTripUseCase>())
            ..add(LoadTripDetailsEvent(tripId: tripModel.id.toString())),
      child: BlocConsumer<TripDetailsBloc, TripDetailsState>(
        listener: (context, state) {
          if (state is TripDetailsLoaded) {
            if (state.isAccepting) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Dialog(
                  backgroundColor: Colors.transparent,
                  child: CustomLoadingWidget(),
                ),
              );
            }

            if (state.acceptSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              AppSnackBar.showSuccess(context, "Trip accepted successfully");
            }

            if (state.acceptError != null) {
              Navigator.of(context, rootNavigator: true).pop();
              AppSnackBar.showError(context, state.acceptError!);
            }
          }
        },
        builder: (context, state) {
          if (state is TripDetailsLoading) {
            return _buildLoading();
          }

          if (state is TripDetailsLoaded) {
            final acceptedOffer = getAcceptedOffer(state.trip.offers);

            return LoadDetailedScreenItem(
              offerModel: acceptedOffer,
              load: state.trip,
              getStatusIcon: _getStatusIcon,
            );
          }

          if (state is TripDetailsError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      )

    );
  }

  final fakeTrip = TripDetailsModel(
    tripTitle: '',
    id: 101,
    status: TripStatus.pending,

    pickupAddress: 'Nasr City, Cairo',
    pickupLat: 30.0561,
    pickupLng: 31.3300,

    destinationAddress: 'New Cairo',
    destinationLat: 30.0074,
    destinationLng: 31.4913,

    vehicleType: 'truck',
    basePrice: 45000.0,

    scheduledAt: DateTime.now().add(const Duration(days: 1)),
    description: 'Delivery of construction materials',
    notes: 'Handle with care',

    user: UserProfileModel(

        id: 57,
        name: 'Belal Ahmed',
        email: 'belal@test.com',
        phone: '+201000000000',
        photoUrl: null,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        type: 'user'
        ,twoFactorEnabled: false, updatedAt: DateTime.now()
    ),

    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    updatedAt: DateTime.now(), offers: [],
  );

  /// 🔄 Loading Skeleton
  Widget _buildLoading() {
    return Skeletonizer(
      enabled: true,
      child: LoadDetailedScreenItem(
        load: fakeTrip, // snapshot
        getStatusIcon: _getStatusIcon,
      ),
    );
  }

  /// 🟢 Status Icon Mapper
  IconData _getStatusIcon(String status) {
    switch (status) {
      case "pending":
        return Icons.access_time_filled_rounded;
      case "started":
        return Icons.local_shipping_rounded;
      case "completed":
        return Icons.check_circle_rounded;
      case "cancelled":
        return Icons.cancel_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }
}
