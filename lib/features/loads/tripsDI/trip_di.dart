import 'package:get_it/get_it.dart';
import 'package:user_app_iraq/features/loads/domain/use_cases/cancel_use_case.dart';
import '../data/data_sources/remote/trip_ds.dart';
import '../data/data_sources/remote/trip_ds_imp.dart';
import '../data/repositories/trip_repo_imp.dart';
import '../domain/repositories/trip_domina_repo.dart';
import '../domain/use_cases/get_trip_details.dart';
import '../domain/use_cases/get_trip_use_case.dart';
import '../presentation/bloc/getTripsBloc/trips_bloc.dart';
import '../presentation/bloc/get_trip_details/get_trip_details_bloc.dart';

void tripsDI(GetIt getIt) {
  getIt.registerLazySingleton<TripsRemoteDS>(
        () => TripsRemoteDSImp(),
  );

  getIt.registerLazySingleton<TripsDomainRepo>(
        () => TripsDataRepo(getIt()),
  );

  getIt.registerLazySingleton(() => GetTripsUseCase(getIt()));
  getIt.registerLazySingleton(() => CancelTripUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTripDetailsUseCase(getIt()));

  getIt.registerFactory(() => TripsBloc(getIt(),getIt()));
  getIt.registerFactory(() => TripDetailsBloc(getIt()));
}
