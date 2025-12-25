import 'package:bloc/bloc.dart';

import '../../data/models/complaint_mode.dart';
import '../../domain/use_cases/send_complaint_use_case.dart';
import 'complaint_events.dart';
import 'copmlaint_states.dart';




class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  final SubmitComplaintUseCase submitComplaintUseCase;

  ComplaintBloc(this.submitComplaintUseCase) : super(ComplaintFormState()) {
    on<SubmitComplaintEvent>(_onSubmitComplaint);
    on<UpdateComplaintTypeEvent>(_onUpdateType);
    on<UpdateComplaintPriorityEvent>(_onUpdatePriority);
    on<UpdateAnonymousEvent>(_onUpdateAnonymous);
    on<ResetComplaintFormEvent>(_onResetForm);
  }

  void _onUpdateType(
      UpdateComplaintTypeEvent event,
      Emitter<ComplaintState> emit,
      ) {
    emit(
      ComplaintFormState(
        selectedType: event.type,
        selectedPriority: state.selectedPriority,
        isAnonymous: state.isAnonymous,
      ),
    );
  }

  void _onUpdatePriority(
      UpdateComplaintPriorityEvent event,
      Emitter<ComplaintState> emit,
      ) {
    emit(
      ComplaintFormState(
        selectedType: state.selectedType,
        selectedPriority: event.priority,
        isAnonymous: state.isAnonymous,
      ),
    );
  }
  void _onUpdateAnonymous(
      UpdateAnonymousEvent event,
      Emitter<ComplaintState> emit,
      ) {
    emit(
      ComplaintFormState(
        selectedType: state.selectedType,
        selectedPriority: state.selectedPriority,
        isAnonymous: event.isAnonymous,
      ),
    );
  }


  void _onResetForm(
    ResetComplaintFormEvent event,
    Emitter<ComplaintState> emit,
  ) {
    emit(ComplaintFormState());
  }

  Future<void> _onSubmitComplaint(
      SubmitComplaintEvent event,
      Emitter<ComplaintState> emit,
      ) async {
    emit(
      ComplaintLoading(
        selectedType: state.selectedType,
        selectedPriority: state.selectedPriority,
        isAnonymous: state.isAnonymous,
      ),
    );

    final result = await submitComplaintUseCase(event.request);

    result.isSuccess
        ? emit(
      ComplaintSuccess(
        result.data,
        selectedType: state.selectedType,
        selectedPriority: state.selectedPriority,
        isAnonymous: state.isAnonymous,
      ),
    )
        : emit(
      ComplaintError(
        result.error.toString(),
        selectedType: state.selectedType,
        selectedPriority: state.selectedPriority,
        isAnonymous: state.isAnonymous,
      ),
    );
  }

}