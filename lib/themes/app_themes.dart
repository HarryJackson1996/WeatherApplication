import 'package:flutter/material.dart';
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
    primaryColor: Colors.black,
    backgroundColor: Color.fromRGBO(20, 20, 20, 1),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 25.0,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 20.0,
      ),
    ),
    cardColor: Color.fromRGBO(40, 40, 40, 1),
    buttonColor: Colors.white,
    indicatorColor: Colors.white,
    primaryColorBrightness: Brightness.light,
  ),
  AppTheme.LIGHT: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: Color.fromRGBO(240, 240, 240, 1),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 25.0,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 20.0,
      ),
    ),
    cardColor: Colors.white,
    buttonColor: Colors.black,
    indicatorColor: Colors.black,
    primaryColorBrightness: Brightness.dark,
  ),
};
