// ignore_for_file: file_names

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:qookit/services/services.dart';

import 'getIt.config.dart';

final getIt = GetIt.instance;

// flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);

Future<bool> initializeServices() async {
  await settingsService.initializeSettings();
  return await userService.initializeUser();
}
