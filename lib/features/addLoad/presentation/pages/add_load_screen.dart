import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/core/sharedWidgets/custom_loading.dart';
import 'package:user_app_iraq/features/addLoad/domain/use_cases/location_use_case.dart';
import 'package:user_app_iraq/features/addLoad/domain/use_cases/vehicle_use_case.dart';
import 'package:user_app_iraq/features/addLoad/presentation/bloc/add_load_bloc.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/main_wrapper.dart';
import '../bloc/add_load_event.dart';
import '../bloc/add_load_states.dart';
import '../widgets/loads_screens_item/loads_item.dart';
import '../widgets/successWidget/success_widget.dart';

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
        if (state is GetVehiclesFailure) {
          AppSnackBar.showError(context, state.message);
          await Future.delayed(Duration(seconds: 2));
          Navigator.pop(context); // close loading dialog
        }
        if (state is AddLoadFailureWithoutLoading) {
          AppSnackBar.showError(context, state.message);
        }

        if (state is AddLoadSubmitSuccess) {
          Navigator.pop(context); // close loading dialog

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: showSuccessDialog(context)),
          );
        }
        if (state is AddLoadSubmitFailure) {
          Navigator.pop(context);
          AppSnackBar.showError(context, state.message);
        }

        if (state is AddLoadLocationFailure) {
          if (state.message == "denied") {
            await showLocationPermissionDialog(context);

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
      title:   Text(LocaleKeys.Add_Load_location_permission_required.tr()),
      content:   Text(
        LocaleKeys.Add_Load_location_permission_message.  tr()
       ),
      actions: [
        TextButton(
          child:   Text(LocaleKeys.Add_Load_cancel.tr()),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child:   Text(LocaleKeys.Add_Load_open_settings.tr()),
          onPressed: () async {
            Navigator.pop(context);
            await Geolocator.openAppSettings();
          },
        ),
      ],
    ),
  );
}
