import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/models/expiry_group.dart';
import 'package:qookit/models/pantry_item.dart';
import 'package:qookit/services/getIt.dart';
import 'package:qookit/services/theme/theme_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

bool preview = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  print('just before model setup');
  //unawaited(mlService.setupModel());

  /// Initialize hive stuff
  await Hive.initFlutter();
  Hive.registerAdapter(PantryItemAdapter());
  Hive.registerAdapter(ExpiryGroupAdapter());

  await Hive.openBox('master');
  await Hive.box('master').put('ready', false);

  /// Initialize stacked themes
  await ThemeManager.initialise();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /*await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays: [
    SystemUiOverlay.top,
  ]);*/

  await SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        darkTheme: qookitDark,
        lightTheme: qookitLight,
        defaultThemeMode: ThemeMode.light,
        builder: (context, regularTheme, darkTheme, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: Container(),
            builder: (context, nativeNavigator) {
              return ExtendedNavigator.builder<AppRouter>(
                  router: AppRouter(),
                  name: 'topNav',
                  builder: (context, child) => child)(context, nativeNavigator);
            },
            color: Colors.red,
          );
        });
  }
}
