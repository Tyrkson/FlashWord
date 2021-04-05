import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData light = ThemeData.light().copyWith(
      primaryColor: Color(0xFFe7f2f8),
      accentColor: Color(0xFFffa384),
      scaffoldBackgroundColor: Color(0xFFe7f2f8),
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF74bdcb)),
          bodyText2: TextStyle(color: Color(0xFFefe7bc))));

  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Color(0xFFee8282),
    accentColor: Color(0xFFd9d9bd),
  );
}
