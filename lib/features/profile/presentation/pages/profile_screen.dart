import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/core/cahsing/secure_storage.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
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
      create: (_) => getIt<ProfileBloc>()..add(GetProfileEvent()),

      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) async {
          if (state is ProfileError) {
            return AppSnackBar.showError(context, state.message);
          }

          if (state is LogoutFailure) {

            return AppSnackBar.showError(context, state.message);
          }
          if (state is LogoutSuccess) {


            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          }
        },

         builder: (context, state) {
          if (state is ProfileLoading) {
            return profile_loading();
          }
          if (state is ProfileLoaded) {
            return ProfileScreenItem(profileModel: state.user);
          } else if (state is LogoutLoading) {
          return  Stack(
              children: [
                ProfileScreenItem(
                  profileModel: context.watch<ProfileBloc>().userProfileModel!,
                ),
                CustomLoadingWidget(),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  final fakeUserProfile = UserProfileModel(
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

    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  );

  Widget profile_loading() {
    return Skeletonizer(
      child: ProfileScreenItem(profileModel: fakeUserProfile),
    );
  }
}
