import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../core/sharedWidgets/custom_loading.dart';
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/location_model.dart';
import '../../../bloc/add_load_bloc.dart';
import '../../../bloc/add_load_event.dart';
import '../../../bloc/add_load_states.dart';
import '../../build_card_info.dart';
import 'build_location_item.dart';
import '../map/google_maps.dart';

class PickupAndDelivery extends StatelessWidget {
  PickupAndDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddLoadBloc, AddLoadState>(
      listener: (context, state) {
        if (state is AddLoadGetLocationLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: CustomLoadingWidget()),
          );
        }


        if (state is AddLoadLocationSuccess) {
          Navigator.pop(context);
          final pos = state.location as Position;
          _openMapScreen(
            context,
            state.address,
            pos.latitude,
            pos.longitude,
            state.isPickup, // هنا
          );
        }
      },

      child: buildCard(
        title: "Pickup & Delivery",
        icon: Icons.location_on_outlined,
        children: [
          buildItem(
            context,
            title: "Pickup Location",
            color: Colors.orange,
            icon: Icons.upload_outlined,
            isPickup: true,
          ),
          const SizedBox(height: 12),
          buildItem(
            context,
            title: "Delivery Location",
            color: Colors.blueGrey,
            icon: Icons.download_outlined,
            isPickup: false,
          ),
        ],
      ),
    );
  }

  Future<void> _openMapScreen(
    BuildContext context,
    String address,
    double lat,
    double lng,
    bool isPickup,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<AddLoadBloc>(), // ← الحل هنا
          child: GoogleMapScreen(address: address, lat: lat, lng: lng),
        ),
      ),
    );

    if (result != null) {
      context.read<AddLoadBloc>().add(
        isPickup
            ? SavePickupLocationEvent(
                result["lat"],
                result["lng"],
                result["address"],
              )
            : SaveDeliveryLocationEvent(
                result["lat"],
                result["lng"],
                result["address"],
              ),
      );
    }
  }
}
