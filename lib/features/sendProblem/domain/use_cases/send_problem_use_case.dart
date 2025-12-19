import '../../../../../core/handleErrors/result_pattern.dart';
import '../../data/models/problem_model.dart';
import '../repositories/problem_domain_repp.dart';

class SendProblemUseCase {
  final ProblemRepo repo;

  SendProblemUseCase(this.repo);

  Future<Result> call(ProblemModel problem) async {
    return await repo.sendProblem(problem);
  }
}
