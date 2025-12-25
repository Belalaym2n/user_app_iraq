
import '../../../../../core/apiManager/api_manager.dart';
import '../../../../../core/apiManager/end_points.dart';
import '../../../../../core/handleErrors/result_pattern.dart';
import '../../../../../core/utils/app_colors.dart';
import 'get_ads_remote_ds.dart';

class AdsRemoteDSImp implements AdsRemoteDS {
  @override
  Future<Result> getActiveAds() async {
    // final response = await ApiService.request(
    //   endpoint: AppEndPoints.trips,
    //   method: "GET",
    //   queryParameters: {"locale": "en", "active": "true"},
    // );
    //
    // if (response is Result) {
    //   return response;
    // }
    //
    // final List ads = response['data'];
    // final result = ads.map((e) => AdModel.fromJson(e)).toList();

 await  Future.delayed(Duration(seconds: 2));
final List<AdModel>ads=[];
    final List<AdModel> fakeAds = [
      AdModel(
        id: 1,
        headline: 'Special Discount 50% OFF',
        description: 'Get amazing discounts on all transportation services this week only!',
        images: [
          'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=800',
          'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=800',
        ],
        actionUrl: '/offers/discount-50',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now(),
      ),
      AdModel(
        id: 2,
        headline: 'New Premium Trucks Available',
        description: 'Book our new fleet of premium trucks with advanced safety features and GPS tracking.',
        images: [
          'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=800',
          'https://images.unsplash.com/photo-1566024287286-457247b70310?w=800',
        ],
        actionUrl: '/trucks/premium',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now(),
      ),
      AdModel(
        id: 3,
        headline: 'Fast Delivery Service',
        description: 'Same-day delivery now available in Baghdad and major cities. Book now!',
        images: [
          'https://images.unsplash.com/photo-1566024287286-457247b70310?w=800',
          'https://images.unsplash.com/photo-1601362840469-51e4d8d58785?w=800',
          'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=800',
        ],
        actionUrl: '/services/fast-delivery',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      ),
      AdModel(
        id: 4,
        headline: 'Refer a Friend, Earn Rewards',
        description: 'Invite your friends and get 100,000 IQD credit for each successful referral!',
        images: [
          'https://images.unsplash.com/photo-1601362840469-51e4d8d58785?w=800',
        ],
        actionUrl: '/referral',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        updatedAt: DateTime.now(),
      ),
      AdModel(
        id: 5,
        headline: 'Track Your Load in Real-Time',
        description: 'New feature: Live GPS tracking for all your shipments. Know exactly where your cargo is!',
        images: [
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
          'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=800',
        ],
        actionUrl: '/features/tracking',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
        updatedAt: DateTime.now(),
      ),
    ];

    return Result.success(ads);
  }
}