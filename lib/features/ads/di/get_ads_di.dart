import 'package:get_it/get_it.dart';

 import '../data/data_sources/remote/get_ads_remote_ds.dart';
import '../data/data_sources/remote/get_ads_remote_ds_imp.dart';
import '../data/repositories/get-ads_data_repo.dart';
import '../domain/getAdsUseCases/get_ads_use_case.dart';
import '../domain/repositories/get_ads_domain_repo.dart';
import '../presentation/getAdsBloc/get_ads_bloc.dart';

get_ads_di(GetIt getIt){
  // Data Sources
  getIt.registerLazySingleton<AdsRemoteDS>(() => AdsRemoteDSImp());

// Repositories
  getIt.registerLazySingleton<AdsDomainRepo>(
        () => AdsDataRepo(getIt<AdsRemoteDS>()),
  );

// Use Cases
  getIt.registerLazySingleton(() => GetAdsUseCase(getIt<AdsDomainRepo>()));

// Bloc - if you want to register it globally
  getIt.registerFactory(() => AdsBloc(getIt<GetAdsUseCase>()));
 }