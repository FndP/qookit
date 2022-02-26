import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  List<String> subsections = ['ACCOUNT', 'SYSTEM', 'ABOUT US'];

  List<SettingsTile> accountTiles = [
    SettingsTile('MY STORES', 'assets/images/cart_icon.svg'),
    SettingsTile('PAYMENT', 'assets/images/money_icon.svg'),
  ];

  List<SettingsTile> systemTiles = [
    SettingsTile('MEASUREMENT SYSTEM', 'assets/images/stats_icon.svg'),
    SettingsTile('NOTIFICATIONS', 'assets/images/notifications_icon.svg'),
  ];

  List<SettingsTile> aboutUsTiles = [
    SettingsTile('FEEDBACK', 'assets/images/chat_icon.svg'),
    SettingsTile('RATE US', 'assets/images/star_icon.svg'),
  ];
}

class SettingsTile {
  final String label;
  final String iconAsset;

  SettingsTile(this.label, this.iconAsset);
}
