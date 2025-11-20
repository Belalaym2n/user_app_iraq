import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/addLoad/presentation/pages/add_load_screen.dart'
    show AddLoadScreen;
import '../../features/bottomNav/bottom_nav.dart';
import '../../features/login/presentation/widgets/login_screen_item.dart';
import '../../features/notifications/presentation/pages/notification_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/signUp/presentation/pages/sign_up_screen.dart';
import '../../features/splash/onBoard/on_board_item.dart';
import '../../features/splash/splash/splash_screen.dart';
//

class AppRoutes {
  // codia Admin
  static const String homePage = "HomePage/";
  static const String bottomNav = "/dsf";
  static const String profile = "profile/";
  static const String signUp = "signUp/";
  static const String login = "/sdfsdfsdfsdf";
  static const String onBoard = "sf/";
  static const String notification = "notification/";
  static const String autoLogin = "autoLogin/";
  static const String splash = "/";
  static const String lectures = "sfsf/";
  static const String AddLoadScreen = "AddLoadScreen/";

  // security
}

class Routes {
  static onGenerate(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
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
        return MaterialPageRoute(builder: (context) => LoginScreenItem());
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
