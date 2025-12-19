import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/features/loads/data/data_sources/remote/trip_ds.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/last_trip_model.dart' show TripModel;


class TripsRemoteDSImp implements TripsRemoteDS {
  @override
  Future<Result> getTrips() async {
    final response = await ApiService.request(
      endpoint: AppEndPoints.trips,
      method: "GET",
      queryParameters: {"locale": "en"},
    );

    if (response is Result) {
      return response;
    }

    final List trips = response['data'];
    final result = trips.map((e) => TripModel.fromJson(e)).toList();

    return Result.success(result);
  }

  @override
  Future<Result> cancelTrip(String id) async {
    // TODO: implement cancelTrip
    final response = await ApiService.request(
      endpoint: "${AppEndPoints.trips}/$id/cancel",
      method: "POST",
      data: {
        "cancellation_reason": "Driver unavailable"
      },
      queryParameters: {"locale": "en"},
    );

    if (response is Result) {
      return response;
    }


    return Result.success(true); // مجرد تأكيد نجاح
  }

  @override
  Future<Result> getTripDetails(String tripId) async {
    // TODO: implement getTripDetails
    final response = await ApiService.request(
      endpoint: '${AppEndPoints.trips}/$tripId',
      method: 'GET',
      queryParameters: {'locale': 'en'},
    );
    if (response is Result) {

      return response;
    }
    final result = TripDetailsModel.fromJson(response['data']);

        return Result.success(result);
  }
}
