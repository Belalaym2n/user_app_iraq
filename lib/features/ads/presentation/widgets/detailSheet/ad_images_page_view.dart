import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';


class AdImagesPageView extends StatelessWidget {
  final List<String> images;
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const AdImagesPageView({
    super.key,
    required this.images,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: AppConstants.h * 0.35,
        child: PageView.builder(
          controller: controller,
          onPageChanged: onPageChanged,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: AppColors.neutralGray,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: AppConstants.w * 0.2,
                    color: AppColors.textMuted,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
