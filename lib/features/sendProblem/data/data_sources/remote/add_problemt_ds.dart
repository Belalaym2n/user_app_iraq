import '../../../../../core/handleErrors/result_pattern.dart';
import '../../models/problem_model.dart';

abstract class ProblemRemoteDS {
  Future<Result> sendProblem(ProblemModel problem);
}