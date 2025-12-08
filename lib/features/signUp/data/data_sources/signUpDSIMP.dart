import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app_iraq/core/apiManager/end_points.dart';
import 'package:user_app_iraq/features/signUp/data/data_sources/signUpDS.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../core/apiManager/api_manager.dart';
import '../../../../core/handleErrors/exaption_handler.dart';
import '../../../../core/handleErrors/result_pattern.dart';
import '../models/user_model.dart';

class SignUpDSImp implements SignUpDS {
  @override
  Future<Result> createAcc(UserModel userModel) async {

      if (userModel.confirmPassword != userModel.password) {
        return Result.failure(LocaleKeys.register_passwords_do_not_match.tr());
      }

      final response = await ApiService.request(
        endpoint: AppEndPoints.register,
        method: "POST",
        queryParameters: {"locale": "en"},
        data: userModel.toJson(),
      );

      if (response is Result) return response;

      return Result.success(response);

  }
}
