import 'package:equatable/equatable.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}
class SendEmailSuccess extends LoginState {}
class SendEmailFailure extends LoginState {

  final String error;

  SendEmailFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class PasswordResetEmailSent extends LoginState {}
