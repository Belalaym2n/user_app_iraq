import '../../../../core/handleErrors/result_pattern.dart';

abstract class AdsDomainRepo {
  Future<Result> getActiveAds();
}