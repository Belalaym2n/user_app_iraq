import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/app_colors.dart' show AppColors;
import '../../../core/utils/app_constants.dart';
import 'componts.dart' show GetStartBtn, SkipBtn;
import 'onBoardModel.dart';

class BuildSmoothing extends StatefulWidget {
  BuildSmoothing({
    super.key,
    required this.items,
    required this.currentIndex,

    required this.pageController,
  });

  PageController pageController;
  List<OnBoardModel> items;
  int currentIndex = 0;

  @override
  State<BuildSmoothing> createState() => _BuildSmoothingState();
}

class _BuildSmoothingState extends State<BuildSmoothing> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// PAGE INDICATOR
          SmoothPageIndicator(
            controller: widget.pageController,
            count: widget.items.length,
            effect: ExpandingDotsEffect(
              spacing: AppConstants.w * 0.016,
              // 6 / 360
              radius: AppConstants.w * 0.027,
              // 10 / 360
              dotWidth: AppConstants.w * 0.027,
              // 10 / 360
              dotHeight: AppConstants.w * 0.027,
              // 10 / 360
              expansionFactor: 3.8,
              // ثابت، ملوش علاقة بالـ screen size
              dotColor: Colors.grey,
              activeDotColor: AppColors.primaryColor,
            ),
            onDotClicked: (newIndex) {
              setState(() {
                widget.currentIndex = newIndex;
                widget.pageController.animateToPage(
                  newIndex,
                  duration: Duration(
                    milliseconds: 500, // ثابت ماليهوش علاقة بالحجم
                  ),
                  curve: Curves.ease,
                );
              });
            },
          ),

          widget.currentIndex == 2
              /// GET STARTED BTN
              ? GetStartBtn()
              /// SKIP BTN
              : SkipBtn(
                  onTap: () {
                    setState(() {
                      widget.pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                      );
                    });
                  },
                ),
        ],
      ),
    );
  }
}
