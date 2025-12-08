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
import '../pickUpAndDelivery/pickup_and_delivery.dart';
import '../sheduling/sheduling_widget.dart';

class LoadsItem extends StatefulWidget {
    LoadsItem({super.key,

      required this.vehicles,
      this.isLoading=false});
    List<VehicleModel> vehicles;

    bool isLoading;

  @override
  State<LoadsItem> createState() => _LoadsItemState();
}

final _formKey = GlobalKey<FormState>();
final loadController=TextEditingController();
final  descriptionController=TextEditingController();
final  material=TextEditingController();
final  budget=TextEditingController();
final  weight=TextEditingController();
class _LoadsItemState extends State<LoadsItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryColor,
          toolbarHeight: 0),
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
                    AddLoadHeadline(
                      isLoading: widget.isLoading,
                    ),
                    SizedBox(height: AppConstants.h * 0.02),

                    BuildBasicInformation(
                      weight: weight,
                      material: material,
                      loadDescription: descriptionController,
                      loadTitle: loadController,
                      vehicles: widget.vehicles,
                      isLoading: widget.isLoading ,
                    ),
                    SizedBox(height: AppConstants.h * 0.02),

                    PickupAndDelivery(),
                    SizedBox(height: AppConstants.h * 0.02),

                    SchedulingWidget(),
                    SizedBox(height: AppConstants.h * 0.02),

                    BuildBudgetWidget(
                      budget:budget
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
        AddLoadModel fakeLoad = AddLoadModel(
          id: "12345",

          loadTitle: "Test Load - Baghdad Shipment",
          description: "This is a fake load for testing the API flow.",
          materialType: "Steel",
          weight: 1250.5,

          vehicleType: "Toyota Hilux",

          pickupLocation: "Baghdad, Al-Mansour",
          pickupLat: 33.3152,
          pickupLng: 44.3661,

          deliveryLocation: "Basra, Al-Ashar",
          deliveryLat: 30.5081,
          deliveryLng: 47.7835,

          pickupDate: "2025-01-01",
          deliveryDate: "2025-01-03",

          pickupTime: "09:30 AM",
          deliveryTime: "05:00 PM",

          budget: 250.0,
        );
        print("validate");


        context.read<AddLoadBloc>().add(
          SubmitLoadEvent(fakeLoad),
        );

    }}}



