import 'package:get_it/get_it.dart';

import '../../../core/intialization/init_di.dart';
import '../data/data_sources/remote/rade_data_source.dart';
import '../data/data_sources/remote/submite_rate_ds_imp.dart';
import '../data/repositories/rate_data_repo.dart';
import '../domain/repositories/rate_domain_repo.dart';
import '../domain/use_cases/send_rate_use_case.dart';
import '../presentation/RateBloc/rate_bloc.dart';

rate_di(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<RatingRemoteDS>(() => RatingRemoteDSImp());

  // Repositories
  getIt.registerLazySingleton<RatingDomainRepo>(
    () => RatingDataRepo(getIt<RatingRemoteDS>()),
  );

  // Use Cases
  getIt.registerLazySingleton(
    () => SubmitRatingUseCase(getIt<RatingDomainRepo>()),
  );

  // Bloc - if you want to register it globally (optional)
  getIt.registerFactory(() => RatingBloc(getIt<SubmitRatingUseCase>()));
  //   */
}
