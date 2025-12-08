import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../bloc/add_load_bloc.dart';
import '../../bloc/add_load_event.dart';
import '../../bloc/add_load_states.dart';

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
    return Scaffold(
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
            _buildMap(),
            _buildSearchBar(),
            _buildSuggestionsList(),
            _buildConfirmButton(context),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  // ---------------- MAP ----------------
  Widget _buildMap() {
    return BlocBuilder<AddLoadBloc, AddLoadState>(
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

  // ---------------- SUGGESTIONS ----------------
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

  // ---------------- SEARCH BAR ----------------
  Widget _buildSearchBar() {
    return Positioned(
      top: 50,
      left: 20,
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
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- BACK BUTTON ----------------
  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  // ---------------- CONFIRM BUTTON ----------------
  Widget _buildConfirmButton(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: SizedBox(
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade600,
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

          child: const Text("Confirm Location"),
        ),
      ),
    );
  }

  // ---------------- CAMERA ANIMATION ----------------
  Future<void> _animateTo(LatLng pos) async {
    if (!_controller.isCompleted) return;

    final ctrl = await _controller.future;
    ctrl.animateCamera(CameraUpdate.newLatLng(pos));
  }
}
