import '../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/profile_model.dart';
import '../repositories/profile_domain_repo.dart';

class UpdateProfileUseCase {
  final ProfileDomainRepo repo;

  UpdateProfileUseCase(this.repo);

  Future<Result> call(int userId, UserProfileModel user) async {
    return await repo.updateProfile(userId, user);
  }
}