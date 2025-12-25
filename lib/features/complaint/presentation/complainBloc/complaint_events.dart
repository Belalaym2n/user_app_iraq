import '../../data/models/complaint_mode.dart';

abstract class ComplaintEvent  { }
class UpdateComplaintTypeEvent extends ComplaintEvent {
  final ComplaintType? type;
  UpdateComplaintTypeEvent(this.type);

   List<Object?> get props => [type];
}

class UpdateComplaintPriorityEvent extends ComplaintEvent {
  final ComplaintPriority priority;
  UpdateComplaintPriorityEvent(this.priority);

   List<Object?> get props => [priority];
}

class UpdateAnonymousEvent extends ComplaintEvent {
  final bool isAnonymous;
  UpdateAnonymousEvent(this.isAnonymous);

   List<Object?> get props => [isAnonymous];
}

class ResetComplaintFormEvent extends ComplaintEvent {}
class SubmitComplaintEvent extends ComplaintEvent {
  final SubmitComplaintRequest request;
  SubmitComplaintEvent(this.request);

   List<Object?> get props => [request];
}