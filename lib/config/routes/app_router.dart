import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/loads/presentation/pages/load_detsils_screen.dart';
import 'package:user_app_iraq/features/login/presentation/pages/auto_login.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/pages/addProblemPage.dart';

import '../../features/addLoad/presentation/pages/add_load_screen.dart'
    show AddLoadScreen;
import '../../features/bottomNav/bottom_nav.dart';
import '../../features/login/presentation/pages/forget_pass_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/login/presentation/widgets/screensItem/forget_password.dart';
import '../../features/login/presentation/widgets/screensItem/login_screen_item.dart';
import '../../features/notifications/presentation/pages/notification_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/signUp/presentation/pages/sign_up_screen.dart';
import '../../features/splash/onBoard/on_board_item.dart';
 import '../../features/splash/splash/splash_screen.dart';
import '../../features/support/presentation/widgets/supportScreenItem/support_screen_item.dart';
//

class AppRoutes {
  // codia Admin
  static const String homePage = "HomePage/";
  static const String bottomNav = "sdf/";
  static const String profile = "profile/";
  static const String signUp = "signUp/";
  static const String add_load = "add_load/";
  static const String login = "/sdfsdfsdfsdf";
  static const String onBoard = "sf/";
  static const String problems = "problems/";
  static const String forgetPassword = "ForgetPasswordItem/";
  static const String notification = "notification/";
  static const String autoLogin = "AUTOLogin/";
  static const String splash = "/";
  static const String lectures = "sfsf/";
  static const String supportCallWidget = "supportCallWidget/";
  static const String AddLoadScreen = "AddLoadScreen/";
  static const String loadDetailsScreen = "LoadDetailsScreen/";
  // security
}

class Routes {
  static onGenerate(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      //
      case AppRoutes.loadDetailsScreen:
        return MaterialPageRoute(builder: (context) => LoadDetailsScreen());
    //

      case AppRoutes.autoLogin:
        return MaterialPageRoute(builder: (context) => AutoLogin());
    //

      case AppRoutes.add_load:
        return MaterialPageRoute(builder: (context) => AddLoadScreen());
    //
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPassScreen());
    //
      case AppRoutes.problems:
        return MaterialPageRoute(builder: (context) => AddProblemScreen());
    //
      case AppRoutes.supportCallWidget:
        return MaterialPageRoute(builder: (context) => SupportScreenItem());
    //
      case AppRoutes.AddLoadScreen:
        return MaterialPageRoute(builder: (context) => AddLoadScreen());
      //
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      //
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      //
        case AppRoutes.notification:
          return MaterialPageRoute(
            builder: (context) =>   NotificationScreen(),
          );
      //
      //   case AppRoutes.splash:
      //     return MaterialPageRoute(
      //       builder: (context) =>   SplashScreen(),
      //     );
      case AppRoutes.onBoard:
        return MaterialPageRoute(builder: (context) => OnBoard());
      //   case AppRoutes.login:
      //     return MaterialPageRoute(
      //       builder: (context) =>   LoginScreen(),
      //     );
      // // security
      //   case AppRoutes.homePage:
      //     return MaterialPageRoute(
      //       builder: (context) =>   HomePageScreen(),
      //     );
      //
      case AppRoutes.bottomNav:
        return MaterialPageRoute(builder: (context) => BottomNav());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
