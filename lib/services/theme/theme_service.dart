import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_themes/stacked_themes.dart';

@injectable
class ThemeService {
  void setLightMode(BuildContext context) {
    getThemeManager(context).setThemeMode(ThemeMode.light);
  }

  void setDarkMode(BuildContext context) {
    getThemeManager(context).setThemeMode(ThemeMode.dark);
  }

  void toggleLightDarkMode(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme();
  }

  static Color deleteColor = Color(0xFF720000);
}

ThemeData qookitLight = ThemeData(
  /// Colors
  primaryColor: Color(0xFFFFD53F),
  accentColor: Color(0xFFFFBE30),
  backgroundColor: Color(0xFFEAEAEA),
  errorColor: Color(0xFFBE3944),

  fontFamily: 'kabel',

  tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.amber,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(
          color: Colors.amber,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'opensans'),),

  indicatorColor: Colors.amber,

  /// Text
  /*textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: 'georgia_bold',
      fontSize: 32,
    ),
    headline2: TextStyle(
      fontFamily: 'georgia',
      fontSize: 24,
    ),
    headline3: TextStyle(
      fontFamily: 'georgia_bold',
      fontSize: 20,
    ),
    headline4: TextStyle(
      fontFamily: 'opensans',
      fontSize: 20,
    ),
    headline5: TextStyle(
      fontFamily: 'opensans',
      fontSize: 15,
        fontWeight: FontWeight.bold
    ),
    headline6: TextStyle(
      fontFamily: 'opensans',
      fontSize: 16,
    ),
  ),*/
);

TextStyle headerStyle = TextStyle(
  fontFamily: 'georgi0a_bold',
  fontSize: 32,
  color: Colors.black
);

TextStyle subheaderStyle = TextStyle(
    fontFamily: 'opensans',
    fontSize: 14,
    color: Colors.black
);

ThemeData qookitDark = ThemeData();

/*List<ThemeData> getThemes() {
  return [
    ThemeData(backgroundColor: Colors.blue, accentColor: Colors.yellow),
    ThemeData(backgroundColor: Colors.white, accentColor: Colors.green),
    ThemeData(backgroundColor: Colors.purple, accentColor: Colors.green),
    ThemeData(backgroundColor: Colors.black, accentColor: Colors.red),
    ThemeData(backgroundColor: Colors.red, accentColor: Colors.blue),
  ];
}*/
