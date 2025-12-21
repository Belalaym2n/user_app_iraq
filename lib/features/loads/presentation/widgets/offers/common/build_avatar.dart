import 'package:flutter/cupertino.dart';

import '../../../../../../core/utils/app_colors.dart';

class BidAvatar extends StatelessWidget {
  final String letter;

  const BidAvatar({required this.letter});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.2),
            AppColors.primaryColor.withOpacity(0.1),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

