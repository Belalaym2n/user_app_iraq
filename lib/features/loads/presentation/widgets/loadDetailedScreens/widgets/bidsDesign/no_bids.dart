import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/loads/data/models/bids_model.dart' show BidModel;
import 'package:user_app_iraq/features/loads/data/models/load_model.dart' show LoadModel;

import '../../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../data/models/bids_status_model.dart';

class NoBidsWidget extends StatelessWidget {
  const NoBidsWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.gavel_outlined, size: 40, color: AppColors.textMuted),
          const SizedBox(height: 8),
          Text("No bids yet", style: AppTextStyles.headlineSmall()),
        ],
      ),
    );
  }
}
