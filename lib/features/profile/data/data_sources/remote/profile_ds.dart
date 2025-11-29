
import '../../../../../core/handleErrors/result_pattern.dart';

abstract class ProfileRemoteDS {
  Future<Result> getUserProfile( );
  Future<Result> logout( );
  Future<Result> deleteAcc( );
  // Future<Result> updateUserProfile(UserProfileModel user);
}
