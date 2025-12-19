import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/cahsing/app_keys.dart';
import '../../../../../core/cahsing/get_storage_helper.dart';
import '../../../../../core/cahsing/load_data.dart';
import '../../../../../core/cahsing/secure_storage.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../../../signUp/data/models/user_model.dart';
import '../../models/loginModel.dart';
import 'loginRDS.dart';

class LoginRDSImpl implements LoginRDS {
  @override
  Future<Result> login(LoginModel model) async {
    final response = await ApiService.request(
      endpoint: AppEndPoints.login,
      method: "POST",
      queryParameters: {"locale":  UserLocalService.cachedUser?.lang ?? "en"},
      data: model.toJson(),
    );

    if (response is Result) {
      return response; // Result.failure
    }

    final user = UserModel.fromJson(response["data"]);
    await saveUserData(user);

    return Result.success(response);
  }

  @override
  Future<Result> saveUserData(UserModel user) async {
    try {
      SecureStorageHelper.write(AppKeys.userId, user.userID.toString());
      GetStorageHelper.write(AppKeys.name, user.name ?? "");
      GetStorageHelper.write(AppKeys.email, user.gmail);

      return Result.success("data saved");
    } catch (e) {
      return Result.failure("Failed to save data");
    }
  }

  @override
  Future<Result> sendPasswordResetEmail(String email) async {
    print("locale ${ UserLocalService.cachedUser?.lang ?? "en"}");
    // TODO: implement sendPasswordResetEmail
    final response = await ApiService.request(
      endpoint: AppEndPoints.forget_pass,
      method: "POST",
      queryParameters: {"locale":  UserLocalService.cachedUser?.lang ?? "en"},
      data: {"email": email},
    );
    if (response is Result) {
      return response; // Result.failure
    }

    return Result.success(response);
  }
}
