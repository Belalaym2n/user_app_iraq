import 'package:equatable/equatable.dart';

import '../../data/models/profile_model.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {}
class LogoutEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final int userId;
  final UserProfileModel user;

  UpdateProfileEvent({required this.userId, required this.user});

  @override
  List<Object?> get props => [userId, user];
}