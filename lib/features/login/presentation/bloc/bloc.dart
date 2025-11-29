import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/validations/auth_validation.dart';
import '../../domain/use_cases/forget_password_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'loginEvents.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  LoginBloc({required this.loginUseCase, required this.forgetPasswordUseCase})
    : super(  LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<ForgetPasswordPressed>(_onForgetPasswordPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await loginUseCase(event.model);

    if (result.isSuccess) {
      return emit(LoginSuccess());
    } else {
     return emit(LoginFailure(result.error.toString()));
    }
  }

  Future<void> _onForgetPasswordPressed(
    ForgetPasswordPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await forgetPasswordUseCase(event.email);

    if (result.isSuccess) {
      emit(SendEmailSuccess());
    } else {
      emit(SendEmailFailure(result.error.toString()));
    }
  }
}
