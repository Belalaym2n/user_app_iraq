import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/routes/app_router.dart';
import 'core/utils/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar') ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: Locale("en"),
      child: MyApp(),
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
