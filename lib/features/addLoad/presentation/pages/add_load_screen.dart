import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/core/sharedWidgets/custom_loading.dart';
import 'package:user_app_iraq/features/addLoad/domain/use_cases/location_use_case.dart';
import 'package:user_app_iraq/features/addLoad/domain/use_cases/vehicle_use_case.dart';
import 'package:user_app_iraq/features/addLoad/presentation/bloc/add_load_bloc.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/main_wrapper.dart';
import '../bloc/add_load_event.dart';
import '../bloc/add_load_states.dart';
import '../widgets/loads_screens_item/loads_item.dart';

class AddLoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddLoadBloc>()..add(LoadVehiclesEvent()),
      child: const AddLoadView(),
    );
  }
}

class AddLoadView extends StatelessWidget {
  const AddLoadView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddLoadBloc, AddLoadState>(
      listener: (context, state) async {
        if (state is AddLoadSubmitting) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: CustomLoadingWidget()),
          );
        }
        if (state is AddLoadSubmitSuccess) {
          Navigator.pop(context); // close loading dialog

         AppSnackBar.showSuccess(context, "Success");
        }

        if (state is AddLoadFailure) {
          if (state.message == "denied") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Location permission is required")),
            );
          }


          if (state.message == "deniedForever") {
            await showLocationPermissionDialog(context);
          }
        }
      },
      builder: (context, state) {
        final isLoading = state is VehiclesLoading;

        return MainWrapper(
          childWidget: isLoading
              ? Skeletonizer(
                  enabled: true,
                  child: LoadsItem(vehicles: [], isLoading: true),
                )
              : LoadsItem(vehicles: state.vehicles ?? []),
        );
      },
    );
  }
}

Future<void> showLocationPermissionDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: const Text("Location Permission Required"),
      content: const Text(
        "To use this feature, please allow location permission from settings.",
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text("Open Settings"),
          onPressed: () async {
            Navigator.pop(context);
            await Geolocator.openAppSettings();
          },
        ),
      ],
    ),
  );
}
