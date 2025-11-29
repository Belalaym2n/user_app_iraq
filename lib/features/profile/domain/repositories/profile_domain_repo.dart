import '../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/profile_model.dart';

abstract class ProfileDomainRepo {
  Future<Result> getProfile();
  Future<Result> logout();
  Future<Result> updateProfile(UserProfileModel user);
}
