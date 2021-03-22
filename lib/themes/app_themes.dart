import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
part 'app_themes.g.dart';

@HiveType(typeId: 2)
enum AppTheme {
  @HiveField(0)
  LIGHT,
  @HiveField(1)
  DARK,
}

final appThemeData = {
  AppTheme.DARK: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(240, 240, 240, 1),
    backgroundColor: Color.fromRGBO(20, 20, 20, 1),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 25.0,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 20.0,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 15.0,
      ),
    ),
    cardColor: Color.fromRGBO(40, 40, 40, 1),
    buttonColor: Colors.white,
    indicatorColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    accentColor: Color.fromRGBO(240, 240, 240, 1),
    canvasColor: Color.fromRGBO(20, 20, 20, 1),
  ),
  AppTheme.LIGHT: ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(20, 20, 20, 1),
    backgroundColor: Color.fromRGBO(240, 240, 240, 1),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 25.0,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 20.0,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 15.0,
      ),
    ),
    cardColor: Colors.white,
    buttonColor: Colors.black,
    indicatorColor: Colors.black,
    primaryColorBrightness: Brightness.dark,
    accentColor: Color.fromRGBO(20, 20, 20, 1),
    canvasColor: Color.fromRGBO(240, 240, 240, 1),
  ),
};
