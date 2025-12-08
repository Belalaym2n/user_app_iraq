import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/add_load_domain.dart';

class VehicleUseCase{
  final AddLoadRepo repo;

  VehicleUseCase(this.repo);

  Future<Result> loadVehicle() async {
    return await repo.getVehicles();
  }

}