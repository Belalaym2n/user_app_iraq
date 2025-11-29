import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app_iraq/features/profile/data/data_sources/remote/profile_ds.dart';
import 'package:user_app_iraq/features/profile/domain/use_cases/logout_use_case.dart';

import '../data/data_sources/remote/profile_remote_ds_imp.dart';
import '../data/repositories/profile_data_repo.dart';
import '../domain/repositories/profile_domain_repo.dart';
import '../domain/use_cases/get_profile_use_case.dart';
import '../presentation/bloc/profile_bloc.dart';

void profileDI(GetIt getIt) {
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  getIt.registerLazySingleton<ProfileRemoteDS  >(
        () => ProfileRemoteDSImp( ),
  );

  getIt.registerLazySingleton<ProfileDomainRepo>(
        () => ProfileDataRepo(getIt()),
  );

  getIt.registerLazySingleton(() => GetProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));

  getIt.registerFactory(
        () => ProfileBloc(
      getProfile: getIt(),
      logoutUseCase: getIt(),
     ),
  );
}
