import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../../core/sharedWidgets/main_wrapper.dart';
import '../../../bloc/add_load_bloc.dart';
import '../../../bloc/add_load_event.dart';
import '../../../bloc/add_load_states.dart';

class GoogleMapScreen extends StatefulWidget {
  final double lat;
  final double lng;
  String address;

  GoogleMapScreen({
    super.key,
    required this.address,
    required this.lat,
    required this.lng,
  });

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchCtrl.text = widget.address;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddLoadBloc>().add(InitMapEvent(widget.lat, widget.lng));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
        childWidget:Scaffold(
      body: BlocListener<AddLoadBloc, AddLoadState>(
        listener: (context, state) async {
          if (state is AddLoadAddressUpdated) {
            searchCtrl.text = state.address;
          }

          if (state is AddLoadLocationSelected) {
            _animateTo(LatLng(state.lat, state.lng));
          }
        },
        child: Stack(
          children: [
            buildMap(),
            _buildSearchBar(),
            _buildSuggestionsList(),
            _buildConfirmButton(context),
            _buildBackButton(context),
          ],
        ),
      ),
    ));
  }



  Widget buildMap() {
    return BlocBuilder<AddLoadBloc, AddLoadState>(
      buildWhen: (previous, current) {
        return current is AddLoadMapInitialized ||
            current is AddLoadLocationSelected;
      },
      builder: (context, state) {
        double lat = widget.lat;
        double lng = widget.lng;

        if (state is AddLoadLocationSelected) {
          lat = state.lat;
          lng = state.lng;
        }

        if (state is AddLoadMapInitialized) {
          lat = state.lat;
          lng = state.lng;
        }

        final target = LatLng(lat, lng);

        return GoogleMap(

          initialCameraPosition: CameraPosition(target: target, zoom: 16),
          markers: {
            Marker(
              markerId: const MarkerId("selected_location"),
              position: target,
            ),
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onTap: (LatLng tapped) {
            context.read<AddLoadBloc>().add(
              SelectLocationOnMapEvent(tapped.latitude, tapped.longitude),
            );
          },
          onMapCreated: (ctr) {
            if (!_controller.isCompleted) {
              _controller.complete(ctr);
            }
          },
        );
      },
    );
  }
   Widget _buildSuggestionsList() {
    return Positioned(
      top: 110,
      left: 20,
      right: 20,
      child: BlocBuilder<AddLoadBloc, AddLoadState>(
        builder: (context, state) {
          if (state is AddLoadSearchSuccess && state.predictions.isNotEmpty) {
            return Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: AppConstants.h * 0.3,
                child: ListView.builder(
                  itemCount: state.predictions.length,
                  itemBuilder: (_, i) {
                    final p = state.predictions[i];

                    return ListTile(
                      title: Text(p["description"]),
                      onTap: () {
                        context.read<AddLoadBloc>().add(
                          PickPredictionEvent(p["place_id"], p["description"]),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 50,
      left: 70, // عشان مش يتعارض مع الـ back button
      right: 20,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        child: TextField(
          controller: searchCtrl,
          onChanged: (txt) {
            context.read<AddLoadBloc>().add(SearchPlaceEvent(txt));
          },
          decoration: InputDecoration(
            hintText: "Search for a place...",
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
              size: 22,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }

   Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      child: Material(
        elevation: 6,
        shape: const CircleBorder(),
        color: Colors.white,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

   Widget _buildConfirmButton(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: SizedBox(
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            final state = context.read<AddLoadBloc>().state;

            double lat = widget.lat;
            double lng = widget.lng;

            if (state is AddLoadLocationSelected) {
              lat = state.lat;
              lng = state.lng;
            }

            Navigator.pop(context, {
              "lat": lat,
              "lng": lng,
              "address": searchCtrl.text, // العنوان الحقيقي
            });
          },

          child:   Text(LocaleKeys.Add_Load_confirm_location.tr(),style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
    );
  }

   Future<void> _animateTo(LatLng pos) async {
    if (!_controller.isCompleted) return;

    final ctrl = await _controller.future;
    ctrl.animateCamera(CameraUpdate.newLatLng(pos));
  }
}
