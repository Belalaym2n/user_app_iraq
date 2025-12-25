import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.h * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
              (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.01),
            height: AppConstants.h * 0.008,
            width: currentIndex == index
                ? AppConstants.w * 0.08
                : AppConstants.w * 0.02,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
