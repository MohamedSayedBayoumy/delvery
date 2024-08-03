import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/services/get_it/single_tone.dart';
import 'core/utils/initial_values.dart';
import 'features/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.service();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  InitialValues.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black),
          ),
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.2),
            ),
            child: child!,
          );
        },
        home: const SplashScreen(),
      ),
    );
  }
}
