import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/bloc/problem_states.dart';
import '../../domain/use_cases/send_problem_use_case.dart';
import '../../data/models/problem_model.dart';
import 'events.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final SendProblemUseCase sendProblemUseCase;

  String? selectedCategory;

  ProblemBloc({required this.sendProblemUseCase}) : super(ProblemInitial()) {
    on<SelectProblemCategoryEvent>(_onCategorySelect);
    on<SubmitProblemEvent>(_onSubmitProblem);
  }

  void _onCategorySelect(
    SelectProblemCategoryEvent event,
    Emitter<ProblemState> emit,
  ) {
    selectedCategory = event.category;
    emit(ProblemCategorySelected(event.category));
  }

  Future<void> _onSubmitProblem(
    SubmitProblemEvent event,
    Emitter<ProblemState> emit,
  ) async {
    event.problem.category=selectedCategory??'';
    emit(ProblemSubmitting());

    final result = await sendProblemUseCase(event.problem);

    if (result.isSuccess) {
      emit(ProblemSuccess(result.data));
    } else {
      emit(ProblemError(result.error.toString()));
    }
  }
}
