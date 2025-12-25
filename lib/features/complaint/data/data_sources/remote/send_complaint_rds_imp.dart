import 'package:user_app_iraq/features/complaint/data/data_sources/remote/send_complaint_rds.dart';

import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/complaint_mode.dart';
class ComplaintRemoteDSImp implements ComplaintRemoteDS {
  @override
  Future<Result<ComplaintModel>> submitComplaint(
      SubmitComplaintRequest request) async {
    // Uncomment when API is ready
    // final response = await ApiService.request(
    //   endpoint: AppEndPoints.submitComplaint,
    //   method: "POST",
    //   body: request.toJson(),
    // );
    //
    // if (response is Result) {
    //   return response;
    // }
    //
    // final result = ComplaintModel.fromJson(response['data']);
    // return Result.success(result);

    // Fake response for testing
    await Future.delayed(const Duration(seconds: 2));

    final fakeComplaint = ComplaintModel(
      id: 1,
      userId: 123,
      type: request.type,
       details: request.details,
      priority: request.priority,
      isAnonymous: request.isAnonymous,
      status: 'pending',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return Result.success(fakeComplaint);
  }
}