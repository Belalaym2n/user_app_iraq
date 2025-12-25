import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/intialization/init_di.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../domain/getAdsUseCases/get_ads_use_case.dart';
import '../getAdsBloc/get_ads_bloc.dart';
import '../getAdsBloc/get_ads_events.dart';
import '../getAdsBloc/get_ads_states.dart';
import '../widgets/carsual/carsual_item.dart';
import 'no_ads_exist.dart';

class AdsCarouselWidget extends StatelessWidget {
  const AdsCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.h * 0.22,

      child: BlocProvider(
        create: (_) => AdsBloc(getIt<GetAdsUseCase>())..add(GetAdsEvent()),
        child: BlocBuilder<AdsBloc, AdsState>(
          builder: (context, state) {
            if (state is AdsLoading) {
              return _buildLoadingShimmer();
            }
            if (state is AdsLoaded  ) {
              return     ! state.ads.isNotEmpty?
             NoAdsWidget():
               CarouselItem(
                isLoading: false,
                ads: state.ads,
                enableAutoScroll: true, // ✅ Timer مفعّل
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return Skeletonizer(
      child: CarouselItem(
        isLoading: true,
        ads: _fakeAds,
        enableAutoScroll: false, // ✅ Timer متوقف في الـ shimmer
      ),
    );
  }

  // ✅ Fake data للـ shimmer
  static final List<AdModel> _fakeAds = [
    AdModel(
      id: 1,
      headline: 'Special Discount 50% OFF',
      description: 'Get amazing discounts on all transportation services!',
      images: [
        'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=800',
        'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=800',
      ],
      actionUrl: '/offers/discount-50',
      isActive: true,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now(),
    ),
  ];
}
