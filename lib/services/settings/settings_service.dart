import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsService {

  // List of settings keys
  static const String unitSystem = 'unitSystem';
  static const String profileVisibility = 'profileVisibility';

  Box settingsBox;

  Future<void> initializeSettings() async {
    settingsBox = await Hive.openBox('settings');
  }

  dynamic getSettingFromKey(String key,{dynamic defaultValue}) {
    return settingsBox.get(key,defaultValue: defaultValue);
  }

}  void updateSetting(String key, dynamic value) {}
