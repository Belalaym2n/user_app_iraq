import 'package:equatable/equatable.dart';
import '../../data/models/problem_model.dart';

abstract class ProblemEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectProblemCategoryEvent extends ProblemEvent {
  final String category;
  SelectProblemCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

 
class SubmitProblemEvent extends ProblemEvent {
  final ProblemModel problem;
  SubmitProblemEvent(this.problem);

  @override
  List<Object?> get props => [problem];
}
