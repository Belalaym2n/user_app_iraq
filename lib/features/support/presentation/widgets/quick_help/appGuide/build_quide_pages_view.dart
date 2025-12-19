import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/config/routes/app_router.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../data/models/guide_steps.dart';
import 'build_step_item.dart';

class BuildGuidePageView extends StatefulWidget {
  const BuildGuidePageView({super.key});

  @override
  State<BuildGuidePageView> createState() => _BuildGuidePageViewState();
}

class _BuildGuidePageViewState extends State<BuildGuidePageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: guideSteps.length,
            itemBuilder: (context, index) {
              return buildAppGuideStepPage(guideSteps[index]);
            },
          ),
        ),
        _buildPageIndicator(),
        _buildFooter(),
      ],
    );
  }

  // PAGE INDICATOR
  Widget _buildPageIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.h * 0.020, // 16 / 776
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(guideSteps.length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(
              horizontal: AppConstants.w * 0.011, // 4 / 360
            ),
            width: _currentPage == index
                ? AppConstants.w * 0.088 // 32 / 360
                : AppConstants.w * 0.022,
            // 8 / 360
            height: AppConstants.h * 0.010,
            // 8 / 776
            decoration: BoxDecoration(
              gradient: _currentPage == index
                  ? const LinearGradient(
                colors: [AppColors.primaryColor, AppColors.primaryLight],
              )
                  : null,
              color: _currentPage == index ? null : AppColors.borderColor,
              borderRadius: BorderRadius.circular(
                AppConstants.w * 0.011, // 4 / 360
              ),
            ),
          );
        }),
      ),
    );
  }

  // FOOTER
  Widget _buildFooter() {
    final isLastPage = _currentPage == guideSteps.length - 1;

    return Container(
      padding: EdgeInsets.all(
        AppConstants.w * 0.066, // 24 / 360
      ),
      decoration: BoxDecoration(
        color: AppColors.neutralGray,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.w * 0.077), // 28 / 360
          bottomRight: Radius.circular(AppConstants.w * 0.077), // 28 / 360
        ),
      ),
      child: Row(
        children: [
          // Skip Button
          if (!isLastPage)
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  _pageController.animateToPage(
                    guideSteps.length - 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: AppConstants.h * 0.020, // 16 / 776
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.w * 0.033, // 12 / 360
                    ),
                  ),
                  side: const BorderSide(color: AppColors.borderColor),
                ),
                child: Text(
                  LocaleKeys.onboard_skip.tr(),
                  style: TextStyle(
                    fontSize: AppConstants.w * 0.044, // 16 / 360
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

          if (!isLastPage)
            SizedBox(
              width: AppConstants.w * 0.033, // 12 / 360
            ),

          // Next / Get Started Button
          Expanded(
            flex: isLastPage ? 1 : 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.primaryLight],
                ),
                borderRadius: BorderRadius.circular(
                  AppConstants.w * 0.033, // 12 / 360
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    blurRadius: AppConstants.w * 0.033, // 12 / 360
                    offset: Offset(0, AppConstants.h * 0.005), // 4 / 776
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (isLastPage) {
                 Navigator.pushNamed(
                        context,
                        AppRoutes.AddLoadScreen,
                      );
                                         } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(
                    AppConstants.w * 0.033, // 12 / 360
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppConstants.h * 0.020, // 16 / 776
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {


                          },
                          child: Text(
                            isLastPage ?
                            LocaleKeys.Home_post_load.tr()
                                : LocaleKeys.Support_next.tr(),
                            style: TextStyle(
                              fontSize: AppConstants.w * 0.044, // 16 / 360
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: AppConstants.w * 0.022), // 8 / 360
                        Icon(
                          isLastPage ? Icons.check_circle : Icons.arrow_forward,
                          color: Colors.white,
                          size: AppConstants.w * 0.055, // 20 / 360
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
