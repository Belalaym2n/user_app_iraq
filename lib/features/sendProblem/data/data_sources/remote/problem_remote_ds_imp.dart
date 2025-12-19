import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/problem_model.dart';
import 'add_problemt_ds.dart';

class ProblemRemoteDSImp implements ProblemRemoteDS {
  @override
  Future<Result> sendProblem(ProblemModel problem) async {

    print("problem ${problem.category}");
    if(problem.category.trim().isEmpty){
      return Result.failure(LocaleKeys.Problems_category_required. tr());
    }
    // final response = await ApiService.request(
    //     //   endpoint: AppEndPoints.addProblem,
    //     //   method: "POST",
    //     //   data: problem.toJson(),
    //     // );
    //     //
    //     // if (response is Result) return response;

  await  Future.delayed(Duration(seconds: 2));

    return Result.success(LocaleKeys.Problems_problem_submitted_successfully.tr());
  }
}
