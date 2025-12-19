
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/profile_model.dart';

abstract class ProfileRemoteDS {
  Future<Result> getUserProfile( );
  Future<Result> logout( );
  Future<Result> deleteAcc( );
  Future<Result> updateUserProfile(int userId, UserProfileModel user);
}
