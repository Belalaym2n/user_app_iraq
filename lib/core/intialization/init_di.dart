import 'package:get_it/get_it.dart';

import '../../features/addLoad/loadDi/load_di.dart';
import '../../features/loads/tripsDI/trip_di.dart';
import '../../features/login/di/login_di.dart';
import '../../features/profile/di/sign_up_di.dart';
import '../../features/sendProblem/di/problem_di.dart';
import '../../features/signUp/di/signUpDi.dart';


final getIt = GetIt.instance;

Future<void> initDI() async {
  initialLoginDI(getIt);
  signUpDI(getIt);
  profileDI(getIt);
  locationDI(getIt);
  tripsDI(getIt);
   problemDI(getIt);  // ⬅️ لازم لازم يتضاف!

  // userNotificationInitDi(getIt);
  // addLectureDI(getIt);
  // initialLoginDI(getIt);
  // lecturesDI(getIt);
  // playlistDI(getIt);

}
