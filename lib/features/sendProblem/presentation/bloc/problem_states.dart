import 'package:equatable/equatable.dart';

abstract class ProblemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProblemInitial extends ProblemState {}

class ProblemCategorySelected extends ProblemState {
  final String category;
  ProblemCategorySelected(this.category);

  @override
  List<Object?> get props => [category];
}


class ProblemSubmitting extends ProblemState {}

class ProblemSuccess extends ProblemState {
  String message;
  ProblemSuccess(this.message);
}

class ProblemError extends ProblemState {
  final String message;
  ProblemError(this.message);

  @override
  List<Object?> get props => [message];
}
