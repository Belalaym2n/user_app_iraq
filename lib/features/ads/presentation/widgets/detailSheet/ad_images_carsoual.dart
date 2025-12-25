
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import 'ad_images_page_view.dart';


class AdImageCarousel extends StatelessWidget {
  final List<String> images;
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const AdImageCarousel({
    super.key,
    required this.images,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AdImagesPageView(
          images: images,
          controller: controller,
          onPageChanged: onPageChanged,
        ),
        const AdCloseButton(),
        if (images.length > 1)
          AdImageCounter(
            currentIndex: currentIndex,
            total: images.length,
          ),
        if (images.length > 1)
          AdImageIndicator(
            length: images.length,
            currentIndex: currentIndex,
          ),
      ],
    );
  }
}
class AdCloseButton extends StatelessWidget {
  const AdCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppConstants.h * 0.02,
      right: AppConstants.w * 0.04,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.all(AppConstants.w * 0.02),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: AppConstants.w * 0.06,
          ),
        ),
      ),
    );
  }
}


class AdImageCounter extends StatelessWidget {
  final int currentIndex;
  final int total;

  const AdImageCounter({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppConstants.h * 0.02,
      right: AppConstants.w * 0.04,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.w * 0.03,
          vertical: AppConstants.h * 0.008,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${currentIndex + 1}/$total',
          style: AppTextStyles.labelMedium().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
class AdImageIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  const AdImageIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppConstants.h * 0.02,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
              (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.01),
            height: AppConstants.h * 0.008,
            width: currentIndex == index
                ? AppConstants.w * 0.06
                : AppConstants.w * 0.02,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
