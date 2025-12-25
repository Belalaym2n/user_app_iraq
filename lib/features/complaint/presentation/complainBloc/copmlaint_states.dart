import '../../data/models/complaint_mode.dart';

abstract class ComplaintState {
  final ComplaintType? selectedType;
  final ComplaintPriority selectedPriority;
  final bool isAnonymous;

  const ComplaintState({
    this.selectedType,
    this.selectedPriority = ComplaintPriority.medium,
    this.isAnonymous = false,
  });
}

class ComplaintFormState extends ComplaintState {
  const ComplaintFormState({
    super.selectedType,
    super.selectedPriority,
    super.isAnonymous,
  });

  ComplaintFormState copyWith({
    ComplaintType? selectedType,
    ComplaintPriority? selectedPriority,
    bool? isAnonymous,
  }) {
    return ComplaintFormState(
      selectedType: selectedType ?? this.selectedType,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}

class ComplaintInitial extends ComplaintState {}
class ComplaintLoading extends ComplaintState {
  const ComplaintLoading({
    super.selectedType,
    super.selectedPriority,
    super.isAnonymous,
  });
}

class ComplaintSuccess extends ComplaintState {
  final ComplaintModel complaint;

  const ComplaintSuccess(
      this.complaint, {
        super.selectedType,
        super.selectedPriority,
        super.isAnonymous,
      });
}

class ComplaintError extends ComplaintState {
  final String message;

  const ComplaintError(
      this.message, {
        super.selectedType,
        super.selectedPriority,
        super.isAnonymous,
      });
}
