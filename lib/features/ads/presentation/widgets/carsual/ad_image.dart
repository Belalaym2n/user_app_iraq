import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

class AdImage extends StatelessWidget {
  const AdImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return     Image.network(
        imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.neutralGray,
          child: Icon(
            Icons.image_not_supported_outlined,
            size: AppConstants.w * 0.15,
            color: AppColors.textMuted,
          ),
        );
      },
    );
  }
}
