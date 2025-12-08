import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/screens/load_detailed_screen_item.dart';

import '../../../addLoad/presentation/widgets/basicInformation/build_vehicle.dart';
import '../../data/models/load_model.dart';
import '../../data/models/load_states.dart';

class LoadDetailsScreen extends StatefulWidget {
  const LoadDetailsScreen({super.key});

  @override
  State<LoadDetailsScreen> createState() => _LoadDetailsScreenState();
}

class _LoadDetailsScreenState extends State<LoadDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final fakeLoad = LoadModel(
      id: "LOAD123",
      userId: "USER789",
      title: "Steel Beams Transport",
      pickupLocation: "Baghdad, Al-Mansour",
      deliveryLocation: "Basra, Industrial Area",
      weight: 12.5,
      // Tons
      dimensions: "6m x 1.5m x 1.2m",
      vehicleType: VehicleType.truck,
      budget: 350000,
      // IQD
      pickupDate: DateTime.now().add(const Duration(days: 1)),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
      status: LoadStatus.posted,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bidsCount: 5,
      description: "Heavy steel beams requiring forklift at loading/unloading.",
      requirements: [
        "Forklift Required",
        "Experienced Driver",
        "Straps for securing load",
      ],
      contactPerson: "Ali Mohammed",
      contactPhone: "+9647700000000",
      isUrgent: true,
      distance: 545.0,
      // km
      pickupCoordinates: {"lat": 33.3128, "lng": 44.3615},
      deliveryCoordinates: {"lat": 30.5080, "lng": 47.7835},
      minBudget: 300000,
      maxBudget: 400000,
      specialInstructions: "Handle carefully, no sharp turns.",
      images: [
        "https://dummyimage.com/600x400/cccccc/000000.jpg",
        "https://dummyimage.com/500x300/bbbbbb/000000.jpg",
      ],
      isActive: true,
      viewCount: 143,
      assignedDriverId: null,
    );

    return LoadDetailedScreenItem(
      load: fakeLoad,
        getStatusIcon: (status) {
      switch (status) {
        case "pending":
          return Icons.access_time_filled_rounded;
        case "in_progress":
          return Icons.local_shipping_rounded;
        case "completed":
          return Icons.check_circle_rounded;
        default:
          return Icons.help_outline_rounded;

    }

  },
    );
  }
}
