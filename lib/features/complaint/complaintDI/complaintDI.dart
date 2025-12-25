import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/send_complaint_rds.dart';
import '../data/data_sources/remote/send_complaint_rds_imp.dart';
import '../data/repositories/complaint_data_repo.dart';
import '../domain/repositories/complaint_data_repo.dart';
import '../domain/use_cases/send_complaint_use_case.dart';

complaintDI(GetIt getIt){

// Data Sources
  getIt.registerLazySingleton<ComplaintRemoteDS>(() => ComplaintRemoteDSImp());

// Repositories
  getIt.registerLazySingleton<ComplaintDomainRepo>(
        () => ComplaintDataRepo(getIt<ComplaintRemoteDS>()),
  );

// Use Cases
  getIt.registerLazySingleton(() => SubmitComplaintUseCase(getIt<ComplaintDomainRepo>()));

}