import '../../../../core/handleErrors/result_pattern.dart';
import '../../domain/repositories/get_ads_domain_repo.dart';
import '../data_sources/remote/get_ads_remote_ds.dart';

class AdsDataRepo implements AdsDomainRepo {
  final AdsRemoteDS remoteDS;

  AdsDataRepo(this.remoteDS);

  @override
  Future<Result> getActiveAds() {
    return remoteDS.getActiveAds();
  }
}