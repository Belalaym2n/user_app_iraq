import 'package:equatable/equatable.dart';

import '../../data/models/profile_model.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {}
class LogoutEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final UserProfileModel user;

  UpdateProfileEvent(this.user);

  @override
  List<Object?> get props => [user];
}
