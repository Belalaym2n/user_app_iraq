
// features/rating/data/data_sources/remote/rating_remote_ds_imp.dart
import 'package:user_app_iraq/features/rate/data/data_sources/remote/rade_data_source.dart';

import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/rate_model.dart';

class RatingRemoteDSImp implements RatingRemoteDS {
  @override
  Future<Result> submitRating(SubmitRatingRequest request) async {
    // Uncomment when API is ready
    // final response = await ApiService.request(
    //   endpoint: AppEndPoints.submitRating,
    //   method: "POST",
    //   body: request.toJson(),
    // );
    //
    // if (response is Result) {
    //   return response;
    // }
    //
    // final result = RatingModel.fromJson(response['data']);
    // return Result.success(result);

    // Fake response for testing
    await Future.delayed(const Duration(seconds: 2));

    final fakeRating = RatingModel(
      id: 1,
      userId: 123,
      tripId: request.tripId,
      rating: request.rating,
      description: request.description,
      createdAt: DateTime.now(),
    );

    return Result.success(fakeRating);
  }

  @override
  Result<bool> validateRequest(SubmitRatingRequest request) {
    // 1️⃣ Validate Rating
    if (request.rating <= 0 || request.rating > 5) {
      return Result.failure('Please select a rating between 1 and 5');
    }

    // 2️⃣ Validate Description
    final trimmedDescription = request.description.trim();

    if (trimmedDescription.isEmpty) {
      return Result.failure('Please share your feedback');
    }





    // 3️⃣ Validate Trip ID
    if (request.tripId <= 0) {
      return Result.failure('Invalid trip ID');
    }

    // ✅ All validations passed
    return Result.success(true);
  }


}