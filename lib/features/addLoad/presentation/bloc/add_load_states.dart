import '../../data/models/location_model.dart';
import '../../data/models/vehicle_model.dart';

class AddLoadState {
  final LoadLocationModel? pickupLocation;
  final LoadLocationModel? deliveryLocation;

  final DateTime? pickupDate;
  final DateTime? deliveryDate;

  final List<VehicleModel> vehicles;
  final VehicleModel? selectedVehicle;

  final bool isLoading;

  AddLoadState({
    this.pickupLocation,
    this.deliveryLocation,
    this.pickupDate,
    this.deliveryDate,
    this.vehicles = const [],
    this.selectedVehicle,
    this.isLoading = false,
  });

  AddLoadState copyWith({
    LoadLocationModel? pickupLocation,
    LoadLocationModel? deliveryLocation,
    DateTime? pickupDate,
    DateTime? deliveryDate,
    List<VehicleModel>? vehicles,
    VehicleModel? selectedVehicle,
    bool? isLoading,
  }) {
    return AddLoadState(
      pickupLocation: pickupLocation ?? this.pickupLocation,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      pickupDate: pickupDate ?? this.pickupDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      vehicles: vehicles ?? this.vehicles,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// -------------------- STATES --------------------

class AddLoadInitial extends AddLoadState {}

// -------------------- FAILURE --------------------
class AddLoadFailure extends AddLoadState {
  final String message;

  AddLoadFailure(
      this.message, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required List<VehicleModel> vehicles,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}

// -------------------- VEHICLE LOADING --------------------

class VehiclesLoading extends AddLoadState {
  VehiclesLoading({
    required LoadLocationModel? pickupLocation,
    required LoadLocationModel? deliveryLocation,
    required DateTime? pickupDate,
    required DateTime? deliveryDate,
    required List<VehicleModel> vehicles,
    required VehicleModel? selectedVehicle,
  }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
    isLoading: true,
  );
}

class AddLoadVehiclesSuccess extends AddLoadState {
  AddLoadVehiclesSuccess(
      List<VehicleModel> vehicles, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}

// -------------------- LOCATION UPDATES --------------------

class AddLoadLocationSuccess extends AddLoadState {
  final dynamic location;
  final String address;
  final bool isPickup;

  AddLoadLocationSuccess({
    required this.location,
    required this.address,
    required this.isPickup,
    required LoadLocationModel? pickupLocation,
    required LoadLocationModel? deliveryLocation,
    required DateTime? pickupDate,
    required DateTime? deliveryDate,
    required List<VehicleModel> vehicles,
    required VehicleModel? selectedVehicle,
  }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}

class AddLoadMapInitialized extends AddLoadState {
  final double lat;
  final double lng;

  AddLoadMapInitialized(
      this.lat,
      this.lng, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required List<VehicleModel> vehicles,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}

class AddLoadLocationSelected extends AddLoadState {
  final double lat;
  final double lng;

  AddLoadLocationSelected(
      this.lat,
      this.lng, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required List<VehicleModel> vehicles,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}

class AddLoadAddressUpdated extends AddLoadState {
  final String address;

  AddLoadAddressUpdated(
      this.address, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required List<VehicleModel> vehicles,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}

class AddLoadSearchSuccess extends AddLoadState {
  final List predictions;

  AddLoadSearchSuccess(
      this.predictions, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required List<VehicleModel> vehicles,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
  );
}


class AddLoadSubmitting extends AddLoadState {
  AddLoadSubmitting({
    required LoadLocationModel? pickupLocation,
    required LoadLocationModel? deliveryLocation,
    required DateTime? pickupDate,
    required DateTime? deliveryDate,
    required List<VehicleModel> vehicles,
    required VehicleModel? selectedVehicle,
  }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
    isLoading: true,
  );
}

class AddLoadSubmitSuccess extends AddLoadState {
  AddLoadSubmitSuccess({
    required LoadLocationModel? pickupLocation,
    required LoadLocationModel? deliveryLocation,
    required DateTime? pickupDate,
    required DateTime? deliveryDate,
    required List<VehicleModel> vehicles,
    required VehicleModel? selectedVehicle,
  }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
    isLoading: false,
  );
}

class AddLoadSubmitFailure extends AddLoadState {
  final String message;

  AddLoadSubmitFailure(
      this.message, {
        required LoadLocationModel? pickupLocation,
        required LoadLocationModel? deliveryLocation,
        required DateTime? pickupDate,
        required DateTime? deliveryDate,
        required List<VehicleModel> vehicles,
        required VehicleModel? selectedVehicle,
      }) : super(
    pickupLocation: pickupLocation,
    deliveryLocation: deliveryLocation,
    pickupDate: pickupDate,
    deliveryDate: deliveryDate,
    vehicles: vehicles,
    selectedVehicle: selectedVehicle,
    isLoading: false,
  );
}
