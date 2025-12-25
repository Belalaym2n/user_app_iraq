import 'package:get_it/get_it.dart';

import '../../features/addLoad/loadDi/load_di.dart';
import '../../features/ads/di/get_ads_di.dart';
import '../../features/complaint/complaintDI/complaintDI.dart';
import '../../features/loads/tripsDI/trip_di.dart';
import '../../features/login/di/login_di.dart';
import '../../features/profile/di/sign_up_di.dart';
import '../../features/rate/di/rate_di.dart';
import '../../features/sendProblem/di/problem_di.dart';
import '../../features/signUp/di/signUpDi.dart';


final getIt = GetIt.instance;

Future<void> initDI() async {
  initialLoginDI(getIt);
  signUpDI(getIt);
  profileDI(getIt);
  locationDI(getIt);
  tripsDI(getIt);
  complaintDI(getIt);
  rate_di(getIt);
  get_ads_di(getIt);
   problemDI(getIt);  // ⬅️ لازم لازم يتضاف!

  // userNotificationInitDi(getIt);
  // addLectureDI(getIt);
  // initialLoginDI(getIt);
  // lecturesDI(getIt);
  // playlistDI(getIt);

}
