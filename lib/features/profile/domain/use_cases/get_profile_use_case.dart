import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/profile_domain_repo.dart';

class GetProfileUseCase {
  final ProfileDomainRepo repo;

  GetProfileUseCase(this.repo);

  Future<Result> call(   ) async {
    return await repo.getProfile();
  }
}
