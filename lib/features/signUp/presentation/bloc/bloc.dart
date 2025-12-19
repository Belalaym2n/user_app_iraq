import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/signUp/presentation/bloc/signUpEvents.dart';
import 'package:user_app_iraq/features/signUp/presentation/bloc/signUpStates.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../domain/use_cases/signUpCall.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase}) : super(const SignUpInitial()) {
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  Future<void> _onSignUpButtonPressed(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    final result = await signUpUseCase(user: event.user);
    if (result.isSuccess) {
      emit(SignUpSuccess(LocaleKeys.register_account_created_success.tr()));
    } else {
      emit(SignUpFailure(result.error.toString()));
    }
  }
}
