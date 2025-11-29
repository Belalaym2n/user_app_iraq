import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/profile/presentation/bloc/profile_event.dart';
import '../../domain/use_cases/get_profile_use_case.dart';
import '../../domain/use_cases/logout_use_case.dart';
import 'profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfile;
  final LogoutUseCase logoutUseCase;

  ProfileBloc({required this.getProfile, required this.logoutUseCase})
    : super(ProfileInitial()) {
    on<GetProfileEvent>(_onGetProfile);
    on<LogoutEvent>(_logout);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _logout(LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(LogoutLoading());
    final result = await logoutUseCase();

    if (result.isSuccess) {
      emit(LogoutSuccess());
    } else {
      emit(LogoutFailure(result.error.toString()));
    }
  }

  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await getProfile();

    if (result.isSuccess) {
      emit(ProfileLoaded(result.data));
    } else {
      emit(ProfileError(result.error.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    // final result = await updateProfile(event.user);
    //
    // if (result.isSuccess) {
    //   emit(ProfileUpdateSuccess());
    // } else {
    //   emit(ProfileError(result.error.toString()));
    // }
  }
}
