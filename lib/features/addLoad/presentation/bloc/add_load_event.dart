import '../../data/models/load_model.dart';
import '../../data/models/vehicle_model.dart';

abstract class AddLoadEvent {}

class GetCurrentLocationEvent extends AddLoadEvent {
  final bool isPickup;

  GetCurrentLocationEvent({required this.isPickup});
}

class ReverseGeocodeEvent extends AddLoadEvent {}

class InitMapEvent extends AddLoadEvent {
  final double lat;
  final double lng;
  InitMapEvent(this.lat, this.lng);
}

class SelectLocationOnMapEvent extends AddLoadEvent {
  final double lat;
  final double lng;
  SelectLocationOnMapEvent(this.lat, this.lng);
}


class SearchPlaceEvent extends AddLoadEvent {
  final String query;
  SearchPlaceEvent(this.query);
}

class PickPredictionEvent extends AddLoadEvent {
  final String placeId;
  final String description;

  PickPredictionEvent(this.placeId, this.description);
}

class SavePickupLocationEvent extends AddLoadEvent {
  final double lat;
  final double lng;
  final String address;

  SavePickupLocationEvent(this.lat, this.lng, this.address);
}

class SaveDeliveryLocationEvent extends AddLoadEvent {
  final double lat;
  final double lng;
  final String address;

  SaveDeliveryLocationEvent(this.lat, this.lng, this.address);
}


// for vehicle
// ----------- DATE EVENTS --------------
class SelectPickupDateEvent extends AddLoadEvent {
  final DateTime pickupDate;
  SelectPickupDateEvent(this.pickupDate);
}

class SelectDeliveryDateEvent extends AddLoadEvent {
  final DateTime deliveryDate;
  SelectDeliveryDateEvent(this.deliveryDate);
}

class LoadVehiclesEvent extends AddLoadEvent {}
class SelectVehicleEvent extends AddLoadEvent {
  final VehicleModel vehicle;
  SelectVehicleEvent(this.vehicle);
}

class SubmitLoadEvent extends AddLoadEvent {
  final TripModel load;

  SubmitLoadEvent(this.load);
}
