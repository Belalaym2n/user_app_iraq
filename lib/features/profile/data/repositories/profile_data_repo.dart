import 'package:user_app_iraq/features/profile/data/data_sources/remote/profile_ds.dart';

import '../../../../core/handleErrors/result_pattern.dart';
import '../../domain/repositories/profile_domain_repo.dart';
import '../models/profile_model.dart';

class ProfileDataRepo implements ProfileDomainRepo {
  final ProfileRemoteDS profileDS;

  ProfileDataRepo(this.profileDS);

  @override
  Future<Result> getProfile() {
    return profileDS.getUserProfile();
  }

  @override
  Future<Result> updateProfile(int userId, UserProfileModel user) {
    return profileDS.updateUserProfile(userId, user);
  }

  @override
  Future<Result> logout() {
    // TODO: implement logout
    return profileDS.logout();
  }
}
