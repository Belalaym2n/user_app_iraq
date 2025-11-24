import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/splash/onBoard/onBoardModel.dart';

import '../../../core/utils/app_colors.dart' show AppColors;
import 'build_smoothing.dart';
import 'componts.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardScreen();
}

class _OnBoardScreen extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  List<OnBoardModel> items = OnBoardModel.items;
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("w ${AppConstants.w}");
    print("h ${AppConstants.h}");
  }

  /// Anime
  Widget animationDo(int index, int delay, Widget child) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            _build_content(),

            BuildSmoothing(
              items: items,
              currentIndex: currentIndex,

              pageController: pageController,
            ),

            /// ---------------------------
          ],
        ),
      ),
    );
  }

  _build_content() {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: pageController,
        itemCount: items.length,
        onPageChanged: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return SizedBox(
            width: AppConstants.w,
            height: AppConstants.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppConstants.h * 0.15),
                  _build_icon(items[index].icon, index),

                  /// TITLE TEXT
                  _build_headline(index: index),

                  _build_description(index),

                  /// SUBTITLE TEXT
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  _build_description(int index) {
    return animationDo(
      index,
      500,
      Center(
        child: SizedBox(
          width: AppConstants.w * 0.75,
          child: Padding(
            padding:   EdgeInsets.all(AppConstants.w*0.022),
            child: Text(
              items[index].description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.035,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  _build_headline({required int index}) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.h * 0.032,   // 25 / 776
        bottom: AppConstants.h * 0.019, // 15 / 776
      ),      child: animationDo(
        index,
        300,
        Text(
          items[index].headline,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.076,
          ),
        ),
      ),
    );
  }

  _build_icon(IconData icon, int index) {
    return animationDo(
      index,
      100,
      Material(
        borderRadius: BorderRadius.circular(100),

        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: Offset(0, 2), // ظل لفوق
              ),
            ],
          ),
          width: AppConstants.w / 1.8,
          height: AppConstants.w / 1.8,

          child: Icon(icon, size: 80, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
