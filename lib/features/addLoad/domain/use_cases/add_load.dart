import 'package:user_app_iraq/features/addLoad/data/models/load_model.dart';

import '../../../../core/handleErrors/result_pattern.dart';
import '../repositories/add_load_domain.dart';

class AddLoadUseCase {
  final AddLoadRepo repo;

  AddLoadUseCase(this.repo);

  Future<Result> addLoad(TripModel load) async {
    return await repo.addLoad(load);
  }

  String? validateLoad(TripModel load) {
    return repo.validateLoad(load);
  }
}
