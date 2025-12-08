import 'package:get_it/get_it.dart';
import 'package:user_app_iraq/features/addLoad/data/data_sources/remote/add_load_remote_ds_imp.dart';
import 'package:user_app_iraq/features/addLoad/data/data_sources/remote/add_post_remote_ds.dart';
import 'package:user_app_iraq/features/addLoad/data/repositories/add_load_data_source_impl.dart';
import 'package:user_app_iraq/features/addLoad/domain/use_cases/location_use_case.dart';
import 'package:user_app_iraq/features/addLoad/domain/use_cases/vehicle_use_case.dart';
import 'package:user_app_iraq/features/addLoad/presentation/bloc/add_load_bloc.dart';

import '../domain/repositories/add_load_domain.dart';
import '../domain/use_cases/add_load.dart';

void locationDI(GetIt getIt) {
  /// Data Source
  getIt.registerLazySingleton<AddLoadRemoteDS>(() => AddLoadRemoteDSIMP());

  /// Repository
  getIt.registerLazySingleton<AddLoadRepo>(() => AddLoadRepoImpl(getIt()));

  /// Use Cases

  getIt.registerLazySingleton(() => LocationUseCase(getIt()));
  getIt.registerLazySingleton(() => VehicleUseCase(getIt()));
  getIt.registerLazySingleton(() => AddLoadUseCase(getIt()));

  /// Bloc
  getIt.registerFactory(
    () => AddLoadBloc(locationUseCase: getIt(), vehicleUseCase: getIt(),addLoadUseCase:
    getIt(),
  ));
}
