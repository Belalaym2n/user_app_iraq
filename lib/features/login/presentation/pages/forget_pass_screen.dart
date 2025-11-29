import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/login/presentation/widgets/screensItem/forget_password.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/app_snack_bar.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../../../../core/sharedWidgets/main_wrapper.dart';
import '../../domain/use_cases/forget_password_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../bloc/bloc.dart';
import '../bloc/login_states.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final forgetScreen = GlobalKey<ForgetPasswordItemState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        loginUseCase: getIt<LoginUseCase>(),
        forgetPasswordUseCase: getIt<ForgetPasswordUseCase>(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Dialog(
                backgroundColor: Colors.transparent,
                child: CustomLoadingWidget(),
              ),
            );
          } else if (state is SendEmailSuccess) {
            Navigator.pop(context); // تغلق اللودينج

            AppSnackBar.showSuccess(

                context, "Email has been send success");

            forgetScreen.currentState?.clear();
          } else if (state is SendEmailFailure) {
            Navigator.pop(context); // تغلق اللودينج
            return AppSnackBar.showError(context, state.error);
          }
        },

        builder: (context, state) {
          return MainWrapper(
            childWidget: AbsorbPointer(
              absorbing: state is LoginLoading,
              child: ForgetPasswordItem(
                key: forgetScreen,
              ),
            ),
          );
        },
      ),
    );
  }
}
