import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/location_model.dart';
import '../../bloc/add_load_bloc.dart';
import '../../bloc/add_load_event.dart';
import '../../bloc/add_load_states.dart';
import '../build_card_info.dart';
import 'google_maps.dart';

class PickupAndDelivery extends StatelessWidget {
  PickupAndDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<AddLoadBloc, AddLoadState>(
      listener: (context, state) {
        if (state is AddLoadLocationSuccess) {
          final pos = state.location as Position;

          _openMapScreen(
            context,
            state.address,
            pos.latitude,
            pos.longitude,
            state.isPickup,   // هنا
          );
        }
      },

      child: buildCard(
        title: "Pickup & Delivery",
        icon: Icons.location_on_outlined,
        children: [
          _buildItem(
            context,
            title: "Pickup Location",
            color: Colors.orange,
            icon: Icons.upload_outlined,
            isPickup: true,
          ),
          const SizedBox(height: 12),
          _buildItem(
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

  Widget _buildItem(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required bool isPickup,
      }) {
    return BlocBuilder<AddLoadBloc, AddLoadState>(
      builder: (context, state) {
        LoadLocationModel? location =
        isPickup ? state.pickupLocation : state.deliveryLocation;

        return GestureDetector(
          onTap: () {
            context
                .read<AddLoadBloc>()
                .add(GetCurrentLocationEvent(isPickup: isPickup));
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [
                _buildIcon(icon),
                const SizedBox(width: 12),
                Expanded(child: _buildTexts(title, location)),
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.grey, size: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTexts(String title, LoadLocationModel? location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodyLarge()),
        Text(
          location?.address ?? "Tap to select location",
          style: AppTextStyles.bodySmall().copyWith(
            color: location != null ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  // ------------------------------
  // NEW CORRECT MAP OPENING LOGIC
  // ------------------------------
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
          value: context.read<AddLoadBloc>(),   // ← الحل هنا
          child: GoogleMapScreen(
            address: address,
            lat: lat,
            lng: lng,
          ),
        ),
      ),
    );

    if (result != null) {
      context.read<AddLoadBloc>().add(
        isPickup
            ? SavePickupLocationEvent(
            result["lat"], result["lng"], result["address"])
            : SaveDeliveryLocationEvent(
            result["lat"], result["lng"], result["address"]),
      );
    }
  }


}
