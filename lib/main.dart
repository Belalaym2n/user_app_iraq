import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_app_iraq/core/cahsing/get_storage_helper.dart';

import 'config/routes/app_router.dart';
import 'core/apiManager/dio_client.dart';
import 'core/cahsing/load_data.dart';
import 'core/intialization/init_di.dart';
import 'core/utils/app_constants.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
      UserLocalService.loadUserData();

  String? savedLang = GetStorageHelper.read('lang') ?? 'en';

  initDI();

  DioClient.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar') ],
      path: 'assets/translations',
        startLocale: Locale(savedLang),

        fallbackLocale: const Locale('en'),
       child: MyApp()

      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) =>  MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) => Routes.onGenerate(settings),
    );
  }
}
