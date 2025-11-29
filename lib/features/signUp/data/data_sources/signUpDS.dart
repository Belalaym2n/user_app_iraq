
import '../../../../core/handleErrors/result_pattern.dart';
 import '../models/user_model.dart';

abstract class SignUpDS{
 Future<Result> createAcc(UserModel user);
 }