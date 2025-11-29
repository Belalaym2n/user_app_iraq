import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/profile_domain_repo.dart';

class LogoutUseCase {
  final ProfileDomainRepo repo;

  LogoutUseCase(this.repo);

  Future<Result> call(   ) async {
    return await repo.logout();
  }
}
