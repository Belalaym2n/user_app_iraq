import '../../../../../core/handleErrors/result_pattern.dart';
import '../../data/data_sources/remote/add_problemt_ds.dart';
import '../../data/models/problem_model.dart';



abstract class ProblemRepo {
  Future<Result> sendProblem(ProblemModel problem);
}
