// ============================================
// COMPLAINT SCREEN - MODULAR & PROFESSIONAL
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/features/complaint/presentation/widgets/screenItem/complaint_item.dart';
import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/sharedWidgets/text_styles.dart';
import '../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../data/models/complaint_mode.dart';
import '../../domain/use_cases/send_complaint_use_case.dart';
import '../complainBloc/complaint_blpc.dart';
import '../complainBloc/complaint_events.dart';
import '../complainBloc/copmlaint_states.dart';
import '../widgets/common/gradiant_button.dart';

// ============================================
// MAIN SCREEN
// ============================================

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintBloc(getIt<SubmitComplaintUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: BlocConsumer<ComplaintBloc, ComplaintState>(
          listener: _handleBlocListener,
          builder: (context, state) => Stack(children: [ComplaintItem()]),
        ),
      ),
    );
  }

  void _handleBlocListener(BuildContext context, ComplaintState state) {
    if (state is ComplaintLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Dialog(
          backgroundColor: Colors.transparent,
          child: CustomLoadingWidget(),
        ),
      );    }
    if (state is ComplaintSuccess) {
      Navigator.pop(context);
      AppSnackBar.showSuccess(context, 'Complaint submitted successfully!');
      Navigator.pop(context);

    } else if (state is ComplaintError) {
      Navigator.pop(context);

      AppSnackBar.showError(context, state.message);
    }
  }
}
