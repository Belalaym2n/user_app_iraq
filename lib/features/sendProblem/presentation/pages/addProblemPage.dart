import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/features/sendProblem/domain/use_cases/send_problem_use_case.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/bloc/problem_states.dart';

import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/app_snack_bar.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../bloc/problem_bloc.dart';
import '../widgets/add_problem_item.dart';
import '../widgets/screen_widgets/build_main_content.dart';
import '../widgets/screen_widgets/build_problem_header.dart';
import '../widgets/screen_widgets/submittes_issu_success.dart';

class AddProblemScreen extends StatelessWidget {
  const AddProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) =>
          ProblemBloc(sendProblemUseCase: getIt<SendProblemUseCase>()),

      child: BlocConsumer<ProblemBloc, ProblemState>(
        listener: (context, state) async {
          if (state is ProblemSubmitting) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Dialog(
                backgroundColor: Colors.transparent,
                child: CustomLoadingWidget(),
              ),
            );
          } else if (state is ProblemSuccess) {
            Navigator.pop(context); //  تغلق اللودينج

            problemSentSuccessfully(context);
          } else if (state is ProblemError) {
            Navigator.pop(context); // تغلق اللودينج

            AppSnackBar.showError(context, state.message);
          }
        },

        builder: (context, state) {
          return AddProblemItem();
        },
      ),
    );
  }
}
