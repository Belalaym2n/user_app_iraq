import 'package:user_app_iraq/core/handleErrors/result_pattern.dart';
import 'package:user_app_iraq/features/addLoad/data/models/load_model.dart';

import '../../../../core/apiManager/api_manager.dart';
import '../../../../core/apiManager/end_points.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../domain/repositories/add_load_domain.dart';
import '../data_sources/remote/add_post_remote_ds.dart';

class AddLoadRepoImpl implements AddLoadRepo {
  final AddLoadRemoteDS ds;

  AddLoadRepoImpl(this.ds);

  @override
  Future<Result> getCurrentLocation() => ds.getCurrentLocation();

  @override
  Future<Result> reverseGeocode(double lat,double lng) => ds.reverseGeocode(  lat,  lng);

  @override
  Future<Result> getVehicles() =>ds.getVehicles();

  Future<Result> searchPlaces(String query) => ds.searchPlaces(query);


  @override
  Future<Result> getLatLngFromPlaceId(String placeId) =>
      ds.getLatLngFromPlaceId(placeId);

  @override
  Future<Result> addLoad(TripModel load) =>ds.addLoad(load);

  @override
  String? validateLoad(TripModel load)=>ds.validateLoad(load);

}
