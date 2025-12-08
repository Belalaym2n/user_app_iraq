import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/bids_model.dart';
import '../../../../data/models/bids_status_model.dart';
import '../../../../data/models/driver_info.dart';
import '../../../../data/models/load_model.dart' show LoadModel;
import '../bids_section.dart';
import '../build_load_header.dart';
import '../build_load_route.dart';
import '../buttons/view_button.dart';
import '../buttons/view_details_button.dart';
import '../details_chip.dart';
import '../load_details.dart';

typedef ViewLoadCallback = void Function(LoadModel load);

class EnhancedLoadCard extends StatelessWidget {
  final LoadModel load;
  final int index;
  final ThemeData theme;
  final ViewLoadCallback onViewDetails;
  final String Function(String key) tr;

  const EnhancedLoadCard({
    Key? key,
    required this.load,
    required this.index,
    required this.theme,
    required this.onViewDetails,
    required this.tr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fakeBid = BidModel(

      id: "BID123",
      loadId: "LOAD789",
      driverId: "DRIVER456",
      driverName: "Ahmed Hassan",
      transporterPhotoUrl: "https://dummyimage.com/200x200/cccccc/000000.jpg",
      driverRating: 4.7,
      completedTrips: 120,
      bidAmount: 150000,
      currency: "IQD",
      estimatedPickup: DateTime.now().add(const Duration(hours: 5)),
      estimatedDelivery: DateTime.now().add(const Duration(hours: 27)),
      notes: "Can transport fragile items.",
      additionalServices: "Loading + Unloading",
      status: BidStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      updatedAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 10)),
      rejectionReason: null,
      negotiatedAmount: 140000,
      bidRank: 1,

      driverInfo: DriverInfo(
        phoneNumber: "+9647700000000",
        licenseNumber: "Truck 10 Ton",
        photoUrl: "IQ-12345",
        experienceYears: 7,
        name: "Ahmed",
        driverId: "sdf",
        certifications: [],
        emergencyContact: "sdf",
        lastActiveAt: DateTime.now(),
        rating: 23,
        totalTrips: 3,
        isVerified: true,
      ),

      companyName: "FastTrans Co.",
      gstNumber: "GST-998877",
      hasInsurance: true,
      insuranceCoverage: 500000,
      hasGpsTracking: true,
      certifications: ["ISO 9001", "Heavy Load License"],
      previousWorkExamples: "https://dummyimage.com/600x400/aaaaaa/000000.jpg",

      baseAmount: 120000,
      fuelSurcharge: 15000,
      tollCharges: 5000,
      loadingCharges: 4000,
      unloadingCharges: 3000,
      otherCharges: 3000,
    );

    return Padding(    padding: EdgeInsets.all(
    AppConstants.w * 0.0555, // بدل 20
    ),child:

        Container(

      margin: EdgeInsets.only(bottom: 16, top: index == 0 ? 8 : 0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => onViewDetails(load),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadHeader(load: load, theme: theme, tr: tr),
                  const SizedBox(height: 16),
                  RouteInfo(load: load, theme: theme),
                  const SizedBox(height: 16),
                  LoadDetails(load: load, theme: theme),
                  // const SizedBox(height: 16),
                  //
                  const SizedBox(height: 16),

                  EnhancedBidsSection(
                    bid: fakeBid,
                    primaryColor: AppColors.primaryColor,

                    theme: Theme.of(context),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(child: ViewDetailsButton( )),

                      const SizedBox(width: 16),
                      Expanded(child: buildStatusBasedActionButton(load,theme,context)),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}




