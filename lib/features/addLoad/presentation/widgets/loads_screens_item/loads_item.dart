import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/buttons.dart';
import 'package:user_app_iraq/core/sharedWidgets/top_screen_widget.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/addLoad/data/models/load_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../data/models/vehicle_model.dart';
import '../../bloc/add_load_bloc.dart';
import '../../bloc/add_load_event.dart';
import '../basicInformation/build_basic_information.dart';
import '../buildBudegetWidget/build_budget_widget.dart';
import '../loads_widgets/add_load_headline.dart';
import '../pickUpAndDelivery/location/pickup_and_delivery.dart';
import '../sheduling/sheduling_widget.dart';

class LoadsItem extends StatefulWidget {
  LoadsItem({super.key, required this.vehicles, this.isLoading = false});

  List<VehicleModel> vehicles;

  bool isLoading;

  @override
  State<LoadsItem> createState() => _LoadsItemState();
}



class _LoadsItemState extends State<LoadsItem> {
  final _formKey = GlobalKey<FormState>();

  final loadController = TextEditingController();
  final descriptionController = TextEditingController();
  final material = TextEditingController();
  final budget = TextEditingController();
  final weight = TextEditingController();
  final routesController = TextEditingController();

  @override
  void dispose() {
    loadController.dispose();
    descriptionController.dispose();
    material.dispose();
    budget.dispose();
    weight.dispose();
    routesController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: AppColors.primaryColor, toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TopScreenWidget(
                isLoading: widget.isLoading,
                screenIcon: Icons.local_shipping_outlined,

                iconButton: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    weight: AppConstants.w * 0.03,
                  ),
                ),
                text: LocaleKeys.Home_post_load.tr(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: AppConstants.h * 0.02),
                    AddLoadHeadline(isLoading: widget.isLoading),
                    SizedBox(height: AppConstants.h * 0.02),

                    BuildBasicInformation(
                      weight: weight,
                      material: material,
                      loadDescription: descriptionController,
                      loadTitle: loadController,
                      vehicles: widget.vehicles,
                      isLoading: widget.isLoading,
                    ),
                    SizedBox(height: AppConstants.h * 0.02),

                    PickupAndDelivery(),
                    SizedBox(height: AppConstants.h * 0.02),

                    SchedulingWidget(),
                    SizedBox(height: AppConstants.h * 0.02),

                    BuildBudgetWidget(
                      routesController: routesController,
                      budget: budget,
                    ),
                    SizedBox(height: AppConstants.h * 0.02),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: large_button(
                        onPressed: () {
                          _send_request();
                        },
                        buttonName: LocaleKeys.Home_post_load.tr(),
                      ),
                    ),
                    SizedBox(height: AppConstants.h * 0.02),
                    SizedBox(height: AppConstants.h * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _send_request() {
    if (_formKey.currentState!.validate()) {
      print("validate");
      final state = context.read<AddLoadBloc>().state;
      TripModel fakeLoad = TripModel(
        weight: weight.text,
        material: material.text,


        tripTitle: loadController.text,
        destinationDate: state.deliveryDate,

        offers: [],
        vehicleType: state.selectedVehicle?.vehicleType.toString() ?? '',

        pickupLat: state.pickupLocation?.lat ?? 0,
        pickupAddress: state.pickupLocation?.address ?? '',

        pickupLng: state.pickupLocation?.lng ?? 0,
        description: descriptionController.text,
        basePrice: double.tryParse(budget.text) ?? 0.0,
        scheduledAt: state.pickupDate,

        destinationAddress: state.deliveryLocation?.address ?? '',
        destinationLat: state.deliveryLocation?.lat ?? 0,
        destinationLng: state.deliveryLocation?.lng ?? 0,

        pickupDate: state.pickupDate,
      );

      context.read<AddLoadBloc>().add(SubmitLoadEvent(fakeLoad));
    }
  }
}
