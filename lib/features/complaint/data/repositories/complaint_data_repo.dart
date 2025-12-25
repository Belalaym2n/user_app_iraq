// features/complaint/data/repositories/complaint_data_repo.dart
import '../../../../core/handleErrors/result_pattern.dart';
import '../../domain/repositories/complaint_data_repo.dart';
import '../data_sources/remote/send_complaint_rds.dart';
import '../models/complaint_mode.dart';
class ComplaintDataRepo implements ComplaintDomainRepo {
  final ComplaintRemoteDS remoteDS;

  ComplaintDataRepo(this.remoteDS);

  @override
  Future<Result> submitComplaint(
      SubmitComplaintRequest request) {
    return remoteDS.submitComplaint(request);
  }
}