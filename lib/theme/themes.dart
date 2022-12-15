import 'package:flutter/material.dart';

//Themes Of Application Variables
ThemeData themeLight = ThemeData(
  primarySwatch: Colors.green,
  primaryColor: Colors.black,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 24.0),
    bodyText2: TextStyle(fontSize: 27.0, color: Colors.black),
  ),
  brightness: Brightness.light,
);

ThemeData themeDark = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 24.0),
    bodyText2: TextStyle(fontSize: 27.0, color: Colors.white),
  ),
  brightness: Brightness.dark,
);

//Icons Variables
IconData lightModeIcon = Icons.wb_sunny;
IconData darkModeIcon = Icons.nights_stay_sharp;

//Method For Change Appearances
ThemeData currentTheme(bool isDark) {
  return isDark ? themeDark : themeLight;
}

//Method For Change Icons
IconData currentIcon(bool isDark) {
  return isDark ? darkModeIcon : lightModeIcon;
}
