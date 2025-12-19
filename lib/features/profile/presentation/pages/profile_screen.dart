import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:user_app_iraq/features/profile/domain/use_cases/logout_use_case.dart';
import 'package:user_app_iraq/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/page_item/profile_screen_item.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../../data/models/profile_model.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_states.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(
        getProfile: getIt<GetProfileUseCase>(),
        updateProfileUseCase: getIt<UpdateProfileUseCase>(),
        logoutUseCase: getIt<LogoutUseCase>(),
      )..add(GetProfileEvent()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) async {
          if (state is ProfileError) {
            AppSnackBar.showError(context, state.message);
          } else if (state is LogoutFailure) {
            AppSnackBar.showError(context, state.message);
          } else if (state is LogoutSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return _profileLoading();
          }

          if (state is ProfileLoaded) {
            return ProfileScreenItem(profileModel: state.user);
          }

          if (state is ProfileUpdateSuccess || state is ProfileUpdateError) {
            // Show updated profile
            return ProfileScreenItem(
              profileModel: state is ProfileUpdateSuccess
                  ? state.user
                  : context.read<ProfileBloc>().userProfileModel!,
            );
          }

          if (state is LogoutLoading) {
            return Stack(
              children: [
                ProfileScreenItem(
                  profileModel: context.watch<ProfileBloc>().userProfileModel!,
                ),
                CustomLoadingWidget(),
              ],
            );
          }

          if (state is ProfileUpdateLoading) {
            // Show current profile while updating
            return ProfileScreenItem(
              profileModel: context.watch<ProfileBloc>().userProfileModel!,
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  final fakeUserProfile = UserProfileModel(
    type: '',
    id: 999,
    name: "Fake User",
    email: "fake.user@example.com",
    phone: "07501234567",
    photoUrl: "https://example.com/avatar.png",
    dateOfBirth: "1999-01-01",
    city: "Baghdad",
    state: "Baghdad State",
    postalCode: "10011",
    country: "Iraq",
    emailVerifiedAt: DateTime.now(),
    twoFactorEnabled: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Widget _profileLoading() {
    return Skeletonizer(
      child: ProfileScreenItem(profileModel: fakeUserProfile),
    );
  }
}
