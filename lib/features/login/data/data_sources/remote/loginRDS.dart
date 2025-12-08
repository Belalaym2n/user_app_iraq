import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/handleErrors/result_pattern.dart';
import '../../../../signUp/data/models/user_model.dart';
import '../../models/loginModel.dart';

abstract class LoginRDS {
  Future<Result> login(LoginModel model);

  Future<Result> sendPasswordResetEmail(String email); // ✅
  Future<Result> saveUserData(UserModel userId); // ✅
}
