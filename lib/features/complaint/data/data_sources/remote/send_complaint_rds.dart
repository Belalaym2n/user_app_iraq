import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/complaint_mode.dart';

abstract class ComplaintRemoteDS {
  Future<Result> submitComplaint(SubmitComplaintRequest request);
}