import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../getAdsBloc/get_ads_bloc.dart';
import '../../getAdsBloc/get_ads_events.dart';
import '../../getAdsBloc/get_ads_states.dart';
import 'ad_card.dart';
import 'indicator_module.dart';

// ============================================
// carousel_item.dart - الحل النهائي
// ============================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../getAdsBloc/get_ads_bloc.dart';
import '../../getAdsBloc/get_ads_events.dart';
import '../../getAdsBloc/get_ads_states.dart';
import 'ad_card.dart';
import 'indicator_module.dart';

class CarouselItem extends StatefulWidget {
    CarouselItem({
    super.key,
    required this.ads,
    this.enableAutoScroll = true// ✅ هنا الفرق
  ,required this.isLoading});
bool isLoading;
  final List<AdModel> ads;
  final bool enableAutoScroll; // ✅ للتحكم في الـ Timer

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // ✅ Timer يشتغل بس لو enableAutoScroll = true
    if (widget.enableAutoScroll) {
      _timer = Timer.periodic(const Duration(seconds: 4), (_) {
        if (!mounted || widget.ads.isEmpty) return;

        context
            .read<AdsBloc>()
            .add(CarouselNextPage(widget.ads.length));
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdsBloc, AdsState>(
      listener: (context, state) {
        if (state is AdsLoaded && _pageController.hasClients) {
          _pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        }
      },
      child: BlocBuilder<AdsBloc, AdsState>(
        builder: (context, state) {
          // ✅ لو مش AdsLoaded، نعرض الـ ads اللي جايين من widget
          final adsToShow = state is AdsLoaded ? state.ads : widget.ads;
          final currentIndex = state is AdsLoaded ? state.currentIndex : 0;

          return Column(
            children: [
              Container(
                height: AppConstants.h * 0.165,
                margin: EdgeInsets.symmetric(
                  horizontal: AppConstants.w * 0.044,
                  vertical: AppConstants.h * 0.015,
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: adsToShow.length,
                  onPageChanged: (i) {
                     if (widget.enableAutoScroll) {
                      context
                          .read<AdsBloc>()
                          .add(CarouselPageChanged(i));
                    }
                  },
                  itemBuilder: (_, i) => AdCard(
                    isLoading: widget.isLoading,

                      ad: adsToShow[i]),
                ),
              ),
              CarouselIndicator(
                count: adsToShow.length,
                currentIndex: currentIndex,
              ),
            ],
          );
        },
      ),
    );
  }
}


// ============================================
// ads_carousel_widget.dart - الـ Widget الرئيسي
// ============================================

