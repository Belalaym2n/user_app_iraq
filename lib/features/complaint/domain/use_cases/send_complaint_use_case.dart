import '../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/complaint_mode.dart';
import '../repositories/complaint_data_repo.dart';

class SubmitComplaintUseCase {
  final ComplaintDomainRepo repository;

  SubmitComplaintUseCase(this.repository);

  Future<Result> call(SubmitComplaintRequest request) {
    return repository.submitComplaint(request);
  }
}