import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../getAdsBloc/get_ads_bloc.dart';
import '../../getAdsBloc/get_ads_states.dart';
import '../detailSheet/details_sheet.dart';
import 'ad_content.dart';
import 'ad_image.dart';
import 'feature_badge.dart';

class AdCard extends StatelessWidget {
    AdCard({super.key, required this.ad,required this.isLoading});
  bool isLoading;
  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetails(context),
      child:  Container(
        margin: EdgeInsets.symmetric(horizontal: AppConstants.w * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AdImage(imageUrl: ad.images.first),
              const AdGradientOverlay(),
              AdContent(ad: ad,isLoading: isLoading,),
                FeaturedBadge(                    isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AdDetailSheet(ad: ad),
    );
  }
}

class AdGradientOverlay extends StatelessWidget {
  const AdGradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.75),
          ],
          stops: const [0.3, 0.6, 1],
        ),
      ),
    );
  }
}

