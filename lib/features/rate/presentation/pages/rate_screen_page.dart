import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/intialization/init_di.dart';
import '../../../../core/sharedWidgets/app_snack_bar.dart';
import '../../../../core/sharedWidgets/custom_loading.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/sharedWidgets/text_styles.dart';
import '../../data/models/rate_model.dart';
import '../../domain/use_cases/send_rate_use_case.dart';
import '../RateBloc/rate_bloc.dart';
import '../RateBloc/rate_events.dart';
import '../RateBloc/rate_states.dart';
import '../widgets/rating_content.dart';

class RatingBottomSheet extends StatelessWidget {
  final int tripId;
  final String? tripTitle;

  const RatingBottomSheet({super.key, required this.tripId, this.tripTitle});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RatingBloc(getIt<SubmitRatingUseCase>()),
      child: BlocConsumer<RatingBloc, RatingState>(
        listener: (context, state) {
          if (state is RatingLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Dialog(
                backgroundColor: Colors.transparent,
                child: CustomLoadingWidget(),
              ),
            );
          }
          if (state is RatingSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
            AppSnackBar.showSuccess(context, "Rating submitted successfully!");
          } else if (state is RatingError) {
            Navigator.pop(context);
            AppSnackBar.showError(context, state.message);
          }
          if (state is RatingErrorWithoutLoading) {
            Navigator.pop(context);

            AppSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          return RatingContent(tripId: tripId, tripTitle: tripTitle);
        },
      ),
    );
  }
}
