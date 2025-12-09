import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/location_model.dart';
import '../../data/models/vehicle_model.dart';
import '../../domain/use_cases/add_load.dart';
import '../../domain/use_cases/location_use_case.dart';
import '../../domain/use_cases/vehicle_use_case.dart';
import 'add_load_event.dart';
import 'add_load_states.dart';
import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';

class AddLoadBloc extends Bloc<AddLoadEvent, AddLoadState> {
  final LocationUseCase locationUseCase;
  final AddLoadUseCase addLoadUseCase;
  final VehicleUseCase vehicleUseCase;

  AddLoadBloc({
    required this.locationUseCase,
    required this.addLoadUseCase,
    required this.vehicleUseCase,
  }) : super(AddLoadInitial()) {
    // VEHICLES
    on<LoadVehiclesEvent>(_onLoadVehicles);
    on<SelectVehicleEvent>(_onSelectVehicle);

    // LOCATION
    on<GetCurrentLocationEvent>(_onGetCurrentLocation);
    on<InitMapEvent>(_onInitMap);
    on<SearchPlaceEvent>(_onSearchPlace);
    on<PickPredictionEvent>(_onPickPrediction);
    on<SelectLocationOnMapEvent>(_onSelectLocationOnMap);
    on<SubmitLoadEvent>(_onSubmitLoad);

    on<SavePickupLocationEvent>((event, emit) {
      emit(
        state.copyWith(
          pickupLocation: LoadLocationModel(
            lat: event.lat,
            lng: event.lng,
            address: event.address,
          ),
        ),
      );
    });

    on<SaveDeliveryLocationEvent>((event, emit) {
      emit(
        state.copyWith(
          deliveryLocation: LoadLocationModel(
            lat: event.lat,
            lng: event.lng,
            address: event.address,
          ),
        ),
      );
    });

    // ------------- NEW DATE EVENTS ----------------
    on<SelectPickupDateEvent>((event, emit) {
      emit(state.copyWith(pickupDate: event.pickupDate));
    });

    on<SelectDeliveryDateEvent>((event, emit) {
      emit(state.copyWith(deliveryDate: event.deliveryDate));
    });
  }

  // ---------------- VEHICLES ----------------

  Future<void> _onLoadVehicles(
    LoadVehiclesEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    emit(
      VehiclesLoading(
        pickupLocation: state.pickupLocation,
        deliveryLocation: state.deliveryLocation,
        pickupDate: state.pickupDate,
        deliveryDate: state.deliveryDate,
        vehicles: state.vehicles,
        selectedVehicle: state.selectedVehicle,
      ),
    );

    final result = await vehicleUseCase.loadVehicle();

    if (result.isSuccess) {
      emit(
        AddLoadVehiclesSuccess(
          result.data!,
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    } else {
       emit(
        GetVehiclesFailure(
          message: result.error.toString(),
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    }
  }

  void _onSelectVehicle(SelectVehicleEvent event, Emitter<AddLoadState> emit) {
    emit(state.copyWith(selectedVehicle: event.vehicle));
  }

  // ---------------- CURRENT LOCATION ----------------

  Future<void> _onGetCurrentLocation(
    GetCurrentLocationEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    emit(
        AddLoadGetLocationLoading(

          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,

        ));


    final result = await locationUseCase.getCurrentLocation();
    final address = await locationUseCase.reverseGeocode(
      result.data.latitude,
      result.data.longitude,
    );

    if (result.isSuccess && address.isSuccess) {
      emit(
        AddLoadLocationSuccess(
          location: result.data,
          address: address.data,
          isPickup: event.isPickup,
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    } else {
      emit(
        AddLoadLocationFailure(
          result.error.toString(),
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    }
  }

  Future<void> _onSubmitLoad(
    SubmitLoadEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    final validationError=addLoadUseCase.validateLoad(event.load);
    if (validationError != null) {
      emit(
        AddLoadFailureWithoutLoading(
          validationError,
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
      return;
    }
    print("load");
    emit(
      AddLoadSubmitting(
        pickupLocation: state.pickupLocation,
        deliveryLocation: state.deliveryLocation,
        pickupDate: state.pickupDate,
        deliveryDate: state.deliveryDate,
        vehicles: state.vehicles,
        selectedVehicle: state.selectedVehicle,
      ),
    );

    final result = await addLoadUseCase.addLoad(event.load);
    print(result.data);

    if (result.isSuccess) {
      emit(
        AddLoadSubmitSuccess(

          message: "Your trip has been created sucssufully",
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    } else {
      emit(
        AddLoadSubmitFailure(
          result.error.toString(),
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    }
  }

  // ---------------- MAP ----------------

  Future<void> _onInitMap(
    InitMapEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    emit(
      AddLoadMapInitialized(
        event.lat,
        event.lng,
        pickupLocation: state.pickupLocation,
        deliveryLocation: state.deliveryLocation,
        pickupDate: state.pickupDate,
        deliveryDate: state.deliveryDate,
        vehicles: state.vehicles,
        selectedVehicle: state.selectedVehicle,
      ),
    );
  }

  Future<void> _onSelectLocationOnMap(
    SelectLocationOnMapEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    emit(
      AddLoadLocationSelected(
        event.lat,
        event.lng,
        pickupLocation: state.pickupLocation,
        deliveryLocation: state.deliveryLocation,
        pickupDate: state.pickupDate,
        deliveryDate: state.deliveryDate,
        vehicles: state.vehicles,
        selectedVehicle: state.selectedVehicle,
      ),
    );

    final result = await locationUseCase.reverseGeocode(event.lat, event.lng);

    if (result.isSuccess) {
      emit(
        AddLoadAddressUpdated(
          result.data,
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    }
  }

  // ---------------- SEARCH ----------------

  Future<void> _onSearchPlace(
    SearchPlaceEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    final result = await locationUseCase.searchPlaces(event.query);

    if (result.isSuccess) {
      emit(
        AddLoadSearchSuccess(
          result.data,
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );
    }
  }

  Future<void> _onPickPrediction(
    PickPredictionEvent event,
    Emitter<AddLoadState> emit,
  ) async {
    final result = await locationUseCase.getLatLngFromPlaceId(event.placeId);

    if (result.isSuccess) {
      final lat = result.data["lat"];
      final lng = result.data["lng"];

      emit(
        AddLoadLocationSelected(
          lat,
          lng,
          pickupLocation: state.pickupLocation,
          deliveryLocation: state.deliveryLocation,
          pickupDate: state.pickupDate,
          deliveryDate: state.deliveryDate,
          vehicles: state.vehicles,
          selectedVehicle: state.selectedVehicle,
        ),
      );

      final address = await locationUseCase.reverseGeocode(lat, lng);

      if (address.isSuccess) {
        emit(
          AddLoadAddressUpdated(
            address.data,
            pickupLocation: state.pickupLocation,
            deliveryLocation: state.deliveryLocation,
            pickupDate: state.pickupDate,
            deliveryDate: state.deliveryDate,
            vehicles: state.vehicles,
            selectedVehicle: state.selectedVehicle,
          ),
        );
      }
    }
  }
}
