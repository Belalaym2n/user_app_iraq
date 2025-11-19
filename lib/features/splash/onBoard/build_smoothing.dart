import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/app_colors.dart' show AppColors;
import 'componts.dart' show GetStartBtn, SkipBtn;
import 'onBoardModel.dart';

class BuildSmoothing extends StatefulWidget {
  BuildSmoothing({super.key,
    required this.items,
    required this.currentIndex,

    required this.pageController});

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
              spacing: 6.0,
              radius: 10.0,
              dotWidth: 10.0,
              dotHeight: 10.0,
              expansionFactor: 3.8,
              dotColor: Colors.grey,
              activeDotColor: AppColors.primaryColor,
            ),
            onDotClicked: (newIndex) {
              setState(() {
                widget.currentIndex = newIndex;
                widget.pageController.animateToPage(
                  newIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              });
            },
          ),
          widget.currentIndex == 2

          /// GET STARTED BTN
              ? GetStartBtn(size: MediaQuery
              .of(context)
              .size, textTheme: Theme
              .of(context)
              .textTheme)

          /// SKIP BTN
              : SkipBtn(
            size: MediaQuery
                .of(context)
                .size,
            textTheme: Theme
                .of(context)
                .textTheme,
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
