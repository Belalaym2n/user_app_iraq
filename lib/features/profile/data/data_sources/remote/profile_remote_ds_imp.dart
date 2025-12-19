import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' show FormData;
import 'package:user_app_iraq/core/cahsing/app_keys.dart';
import 'package:user_app_iraq/core/cahsing/get_storage_helper.dart';
import 'package:user_app_iraq/features/profile/data/models/profile_model.dart';

import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/cahsing/secure_storage.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import 'profile_ds.dart';

class ProfileRemoteDSImp implements ProfileRemoteDS {
  @override
  Future<Result> getUserProfile() async {
    {
      final response = await ApiService.request(
        endpoint: AppEndPoints.profile,
        method: "Get",
        queryParameters: {"locale": "en"},
      );

      if (response is Result) {
        return response; // Result.failure
      }

      return Result.success(UserProfileModel.fromJson(response["data"]));
    }
  }

  @override
  Future<Result> deleteAcc() async {
    // TODO: implement deleteAcc
    throw UnimplementedError();
  }

  @override
  Future<Result> logout() async {
    final response = await ApiService.request(
      endpoint: AppEndPoints.logout,
      method: "Post",
      queryParameters: {"locale": "en"},
    );

    if (response is Result) {
      return response; // Result.failure
    }
    await SecureStorageHelper.clear();

    return Result.success(response);
  }

  @override
  Future<Result> updateUserProfile(int userId, UserProfileModel user) async {
    // 🔥 استخدم الـ userId اللي جاي من الـ parameter
    final formData = FormData.fromMap({
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      // ... باقي الحقول
    });

    final response = await ApiService.requestWithFormData(
      endpoint: '/users/$userId',
      method: "POST",
      data: formData,
      queryParameters: {"locale": "en"},
    );


    if (response is Result) {
      return response;
    }

    await GetStorageHelper.write(AppKeys.name, user.name);
    return Result.success(UserProfileModel.fromJson(response["data"]));
  }
}
