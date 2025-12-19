
import '../../../../core/handleErrors/result_pattern.dart';
import '../../domain/repositories/problem_domain_repp.dart';
import '../data_sources/remote/add_problemt_ds.dart';
import '../models/problem_model.dart';

class ProblemDataRepo implements ProblemRepo {
  final ProblemRemoteDS problemDS;

  ProblemDataRepo(this.problemDS);

  @override
  Future<Result> sendProblem(ProblemModel problem) {
    return problemDS.sendProblem(problem);
  }
}