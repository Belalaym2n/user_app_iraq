
import '../../../../core/handleErrors/result_pattern.dart';
 import '../../data/models/user_model.dart';

abstract class SignUpDomainRepo {
  Future<Result> createAcc({required UserModel user});
}
