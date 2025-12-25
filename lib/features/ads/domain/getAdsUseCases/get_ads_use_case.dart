import '../../../../core/handleErrors/result_pattern.dart';
import '../../../../core/utils/app_colors.dart';
import '../repositories/get_ads_domain_repo.dart';

class GetAdsUseCase {
  final AdsDomainRepo repository;

  GetAdsUseCase(this.repository);

  Future<Result> call() {
    return repository.getActiveAds();
  }
}