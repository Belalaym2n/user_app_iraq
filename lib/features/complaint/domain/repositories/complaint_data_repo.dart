import '../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/complaint_mode.dart';

abstract class ComplaintDomainRepo {
  Future<Result> submitComplaint(
      SubmitComplaintRequest request);
}