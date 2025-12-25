import '../../../../../core/handleErrors/result_pattern.dart';

abstract class AdsRemoteDS {
  Future<Result> getActiveAds();
}