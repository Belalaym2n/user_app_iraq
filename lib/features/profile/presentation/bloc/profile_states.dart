import 'package:equatable/equatable.dart';

import '../../data/models/profile_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}
class LogoutLoading extends ProfileState {}
class LogoutSuccess extends ProfileState {}
class LogoutFailure extends ProfileState {
  final String message;
  LogoutFailure(this.message);

  @override
  List<Object?> get props => [message];
}



class ProfileLoaded extends ProfileState {
  final UserProfileModel user;
  ProfileLoaded(this.user);

  @override
  List<Object?> get props => [user];
}


class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileUpdateLoading extends ProfileState {}

class ProfileUpdateSuccess extends ProfileState {
  final UserProfileModel user;
  ProfileUpdateSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileUpdateError extends ProfileState {
  final String message;
  ProfileUpdateError(this.message);

  @override
  List<Object?> get props => [message];
}
