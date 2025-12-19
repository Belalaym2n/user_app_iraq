

import 'package:get_it/get_it.dart' show GetIt;

import '../data/data_sources/remote/add_problemt_ds.dart';
import '../data/data_sources/remote/problem_remote_ds_imp.dart';
import '../data/repositories/problemt_data_repo.dart';
import '../domain/repositories/problem_domain_repp.dart';
import '../domain/use_cases/send_problem_use_case.dart';
import '../presentation/bloc/problem_bloc.dart';

void problemDI(GetIt getIt) {
  getIt.registerLazySingleton<ProblemRemoteDS>(() => ProblemRemoteDSImp());

  getIt.registerLazySingleton<ProblemRepo>(
        () => ProblemDataRepo(getIt()),
  );

  getIt.registerLazySingleton(() => SendProblemUseCase(getIt()));

  getIt.registerFactory(() => ProblemBloc(sendProblemUseCase: getIt()));
}
